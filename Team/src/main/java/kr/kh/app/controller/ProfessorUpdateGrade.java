package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.service.GradeService;
import kr.kh.app.service.GradeServiceImp;

@WebServlet("/professor/updategrade")
public class ProfessorUpdateGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GradeService gradeService = new GradeServiceImp();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String co_num = request.getParameter("co_num");
		String co_grade = request.getParameter("co_grade");
		String le_num = request.getParameter("le_num");
		String su_name = request.getParameter("su_name");
		
		if(gradeService.updateGrade(co_num, co_grade)) {
			request.setAttribute("msg", "성적 입력에 성공했습니다.");
			request.setAttribute("url", "/professor/studentlist?le_num="+le_num+"&su_name="+su_name);
		} else {
			request.setAttribute("msg", "성적 입력에 실패했습니다.");
			request.setAttribute("url", "/professor/studentlist?le_num="+le_num+"&su_name="+su_name);
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
