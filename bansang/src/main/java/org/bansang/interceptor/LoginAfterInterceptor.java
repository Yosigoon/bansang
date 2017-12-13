package org.bansang.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import org.bansang.dto.MemberDTO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class LoginAfterInterceptor extends HandlerInterceptorAdapter {
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		if (request.getMethod().equals("GET")) {
			return;
		}

		String auto = request.getParameter("auto"); // 자동 로그인 여부 변수

		Map<String, Object> map = modelAndView.getModel(); // model을 가져온다.

		if (map.get("userSession") != null) { // 로그인 성공했다면 not null

			request.getSession().setAttribute("userSession", map.get("userSession")); // session발급

			if (auto != null) { // 자동 로그인 유무 (쿠키 발급 유무)
				MemberDTO dto = (MemberDTO) map.get("userSession");
				Cookie loginCookie = new Cookie("userCookie", dto.getMemberId());
				loginCookie.setMaxAge(12 * 60 * 60); // 60초(1분) -> 60번(1시간)-> 12번(12시간) 지속 (브라우저 껐다 켜도 지속)
				response.addCookie(loginCookie);
			}
			response.sendRedirect("/bansang/group");
			return;
		}

		return;
	}

}
