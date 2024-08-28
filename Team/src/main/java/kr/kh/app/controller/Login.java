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
			request.setAttribute("url", "/main");
		} else {
			request.setAttribute("msg", "로그인을 완료하지 못했습니다.");
			request.setAttribute("url", "/login");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}