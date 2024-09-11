package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;


@WebServlet("/")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Cookie cookie = getCookie(request,"AL");
		MemberVO user = null; 
		if(cookie != null) {
			String sid = cookie.getValue();
			user = memberService.getMemberBySid(sid);
			if(user != null) {
				request.getSession().setAttribute("user", user);
				
				request.setAttribute("msg", "로그인을 완료했습니다.");
				request.setAttribute("url", "/notice/list");
				
				request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
				return;
			}
			
		}
		
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String me_id = request.getParameter("me_id");
		String me_pw = request.getParameter("me_pw");
		
		MemberVO member = new MemberVO(me_id, me_pw);
		MemberVO user = memberService.login(member);
		
		request.getSession().setAttribute("user", user);
		
		if(user != null) {
			request.setAttribute("msg", "로그인을 완료했습니다.");
			request.setAttribute("url", "/notice/list");
			
			String auto = request.getParameter("auto");
			if(auto != null && auto.equals("true")) {
				Cookie cookie = memberService.createCookie(user,request);
				response.addCookie(cookie);
			}
		} else {
			request.setAttribute("msg", "로그인을 완료하지 못했습니다.");
			request.setAttribute("url", "/login");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
	private Cookie getCookie(HttpServletRequest hrequest, String name) {
		Cookie [] cookies = hrequest.getCookies();
		if(cookies == null || cookies.length == 0) {
			return null;
		}
		for(Cookie cookie : cookies) {
			if(name.equals(cookie.getName())) {
				return cookie;
			}
		}
		return null;
	}
}