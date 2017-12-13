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

		String auto = request.getParameter("auto"); // �ڵ� �α��� ���� ����

		Map<String, Object> map = modelAndView.getModel(); // model�� �����´�.

		if (map.get("userSession") != null) { // �α��� �����ߴٸ� not null

			request.getSession().setAttribute("userSession", map.get("userSession")); // session�߱�

			if (auto != null) { // �ڵ� �α��� ���� (��Ű �߱� ����)
				MemberDTO dto = (MemberDTO) map.get("userSession");
				Cookie loginCookie = new Cookie("userCookie", dto.getMemberId());
				loginCookie.setMaxAge(12 * 60 * 60); // 60��(1��) -> 60��(1�ð�)-> 12��(12�ð�) ���� (������ ���� �ѵ� ����)
				response.addCookie(loginCookie);
			}
			response.sendRedirect("/bansang/group");
			return;
		}

		return;
	}

}
