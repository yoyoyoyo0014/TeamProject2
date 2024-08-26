package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.GradeService;
import kr.kh.app.service.GradeServiceImp;

@WebServlet("/student/gradelist")
public class StudentGradeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GradeService gradeService = new GradeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		List<GradeVO> list = gradeService.getGradeListByStudent(user);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/student/gradelist.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String le_year = request.getParameter("year");
		String le_semester = request.getParameter("semester");
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		List<GradeVO> list = gradeService.getGradeListByYearAndSemester(user, le_year, le_semester);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/student/gradelist.jsp").forward(request, response);
	}

}
