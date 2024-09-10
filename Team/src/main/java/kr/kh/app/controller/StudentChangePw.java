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

@WebServlet("/student/changepw")
public class StudentChangePw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/views/student/changepw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		MemberVO userInfo = memberService.getMember(user);
		
		String me_pw = request.getParameter("me_pw");
		String newPw = request.getParameter("newPw");
		
		if(!userInfo.getMe_pw().equals(me_pw)) {
			request.setAttribute("msg", "현재 비밀번호가 올바르지 않습니다.");
			request.setAttribute("url", "/student/changepw");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		
		if(me_pw.equals(newPw)) {
			request.setAttribute("msg", "현재 비밀번호와 변경된 비밀번호는 같을 수 없습니다.");
			request.setAttribute("url", "/student/changepw");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		
		if(memberService.updateMemberPw(user, newPw)) {
			request.setAttribute("msg", "비밀번호 변경에 성공했습니다.");
			request.setAttribute("url", "/notice/list");
		} else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			request.setAttribute("url", "/student/changepw");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
