package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

@WebServlet("/professor/mypage")
public class ProfessorMypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		MemberVO userInfo = memberService.getMember(user);
		
		request.setAttribute("user", userInfo);
		request.getRequestDispatcher("/WEB-INF/views/professor/mypage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String me_id = request.getParameter("me_id");
		String me_pw = request.getParameter("me_pw");
		String me_name = request.getParameter("me_name");
		String me_email = request.getParameter("me_email");
		
		MemberVO user = new MemberVO(me_id, me_pw, me_name, me_email);
		
		if(memberService.updateMember(user)) {
			request.setAttribute("msg", "회원정보 수정에 성공했습니다.");
			request.setAttribute("url", "/notice/list");
		} else {
			request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
			request.setAttribute("url", "/professor/mypage");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
