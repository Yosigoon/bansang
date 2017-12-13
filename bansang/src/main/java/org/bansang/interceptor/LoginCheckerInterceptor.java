package org.bansang.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bansang.dto.MemberDTO;
import org.bansang.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class LoginCheckerInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		boolean useSession = request.getSession().getAttribute("userSession") != null ? true : false;

		if (useSession) { // 현재 세션 사용중인 상태
			log.info("current user uses session");
			return true;
		}
		Cookie userCookie = WebUtils.getCookie(request, "userCookie");

		boolean useCookie = userCookie != null ? true : false;
		if (useCookie) { // autoLogin Mode
			log.info("current user uses cookie");
			
			MemberDTO dto = memberService.autoLogin(userCookie.getValue());
			if (dto != null) {	// session renew
				session.setAttribute("userSession", dto);
				return true;
			}

		}
		response.sendRedirect("/login");

		return false;
	}

}
