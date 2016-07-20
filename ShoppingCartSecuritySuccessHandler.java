package com.niit.shoppingcart.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class ShoppingCartSecuritySuccessHandler implements AuthenticationSuccessHandler {
	protected final Log logger = LogFactory.getLog(this.getClass());

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	protected ShoppingCartSecuritySuccessHandler() {
		super();
		System.out.println("ShoppingCartSecuritySuccessHandler");

	}

	// API

	@Override
	public void onAuthenticationSuccess(final HttpServletRequest request, final HttpServletResponse response, final Authentication authentication) throws IOException {
		System.out.println("onAuthenticationSuccess");
		handle(request, response, authentication);
		clearAuthenticationAttributes(request);
	}

	// IMPL

	protected void handle(final HttpServletRequest request, final HttpServletResponse response, final Authentication authentication) throws IOException {
		System.out.println("handle");
		final String targetUrl = determineTargetUrl(authentication);

		if (response.isCommitted()) {
			logger.debug("Response has already been committed. Unable to redirect to " + targetUrl);
			return;
		}

		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	protected String determineTargetUrl(final Authentication authentication) {
		System.out.println("determineTargetUrl");
		boolean isUser = false;
		boolean isAdmin = false;
		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (final GrantedAuthority grantedAuthority : authorities) {
			if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
				isUser = true;
				break;
			} else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
				isAdmin = true;
				break;
			}
		}

		if (isUser) {
			return "/homepage.html";
		} else if (isAdmin) {
			return "/console.html";
		} else {
			throw new IllegalStateException();
		}
	}

	/**
	 * Removes temporary authentication-related data which may have been stored in the session
	 * during the authentication process.
	 */
	protected final void clearAuthenticationAttributes(final HttpServletRequest request) {
		System.out.println("clearAuthenticationAttributes");
		final HttpSession session = request.getSession(false);

		if (session == null) {
			return;
		}

		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

	public void setRedirectStrategy(final RedirectStrategy redirectStrategy) {
		System.out.println("setRedirectStrategy");
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		System.out.println("getRedirectStrategy");
		return redirectStrategy;
	}

}
