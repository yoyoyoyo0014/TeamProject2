package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;

@WebServlet("/courseRegistration")
public class CourseRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClassService classService = new ClassServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coLeNumStr = request.getParameter("co_le_num");
		String coMeIdStr = request.getParameter("co_me_id");
		System.out.println("아아");
		int coLeNum =0;
		int coMeId =0;
		
		try {
			coLeNum = Integer.parseInt(coLeNumStr);
			coMeId = Integer.parseInt(coMeIdStr);
		}catch(Exception e) {
			
		}
		if(classService.insertCourse(coLeNum,coMeId)) {
			request.setAttribute("msg", "성공적으로 신청되었습니다.");
			request.setAttribute("url", "/professor/lecturelist");
		}else {
			request.setAttribute("msg", "신청 실패했습니다.");
			request.setAttribute("url", "/professor/lecturelist");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
