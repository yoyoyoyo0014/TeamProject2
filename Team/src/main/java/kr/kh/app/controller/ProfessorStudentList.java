package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;

@WebServlet("/professor/studentlist")
public class ProfessorStudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClassService classService = new ClassServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String le_num = request.getParameter("le_num");
		
		List<CourseVO> list = classService.getStudentList(le_num);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/professor/studentlist.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
