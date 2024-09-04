package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;

@WebServlet("/professor/lecturelist")
public class ProfessorLectureList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClassService classService = new ClassServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		List<LectureVO> list = classService.getLectureListByProfessor(user);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/professor/lecturelist.jsp").forward(request, response);
	}

}
