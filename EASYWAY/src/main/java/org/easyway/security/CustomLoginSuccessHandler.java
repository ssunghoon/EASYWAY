package org.easyway.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.easyway.security.domain.CustomUser;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess( HttpServletRequest request, HttpServletResponse response, Authentication auth )
			throws IOException, ServletException {

		log.warn("Login Success");
		log.info(auth);

		List<String> roleNames = new ArrayList<>();

		auth.getAuthorities().forEach(authority -> {

			roleNames.add(authority.getAuthority());

		});

		log.warn("ROLE NAMES: " + roleNames);

		if (roleNames.contains("ROLE_ADMIN") || roleNames.contains("ROLE_MEMBER")) {

			response.sendRedirect("/office/officelist");
			return;
//			admin으로 로그인하면 바로 /sample/admin 페이지로 이동하게 처리한 것
		}

//		response.sendRedirect("/member/login");
	}
}


