package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;

@WebServlet("/student/courseRegistration")
public class StudentCourseRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClassService classService = new ClassServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		String id = user.getMe_id();
		String coLeNumStr = request.getParameter("co_le_num");
		System.out.println(id);
		System.out.println(coLeNumStr);
		int coLeNum =0;
		
		try {
			coLeNum = Integer.parseInt(coLeNumStr);
		}catch(Exception e) {
			
		}
		if(classService.insertCourse(coLeNum,id)) {
			request.setAttribute("msg", "성공적으로 신청되었습니다.");
			request.setAttribute("url", "/student/lecturelist");
		}else {
			request.setAttribute("msg", "신청 실패했습니다.");
			request.setAttribute("url", "/student/lecturelist");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
