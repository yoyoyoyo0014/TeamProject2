package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;


@WebServlet("/course/delete")
public class CourseDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ClassService classService = new ClassServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String coNumStr = request.getParameter("co_le_num");
		System.out.println(coNumStr);
		int coNum = 0;
		try {
			coNum = Integer.parseInt(coNumStr);
		}catch(Exception e) {
			System.out.println("띠용");
			request.setAttribute("msg", "성공적으로 삭제 실패되었습니다.");
			request.setAttribute("url", "/admin/lecturelist");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		if(classService.deleteCourse(coNum))
		{
			request.setAttribute("msg", "성공적으로 삭제되었습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}else {
			System.out.println("띠용1");
			request.setAttribute("msg", "성공적으로 삭제 실패되었습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
