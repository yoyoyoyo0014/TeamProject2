package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.pagination.AdminGradeCriteria;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.SubjectService;
import kr.kh.app.service.SubjectServiceImp;

@WebServlet("/student/subjectlist")
public class StudentSubjectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SubjectService subjectService = new SubjectServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String pageStr = request.getParameter("page");
			String search = request.getParameter("search");
			int page = 1;
			if(pageStr != null && pageStr.length() != 0) {
				page = Integer.parseInt(pageStr);
			}
			
			Criteria cri = new Criteria(page, 10, search);
			List<SubjectVO> subjectList = subjectService.getSubjectList(cri);

			PageMaker pm = subjectService.getPageMaker(cri, 5);
			
			request.setAttribute("subjectList", subjectList);
			request.setAttribute("pm", pm);
			
			request.getRequestDispatcher("/WEB-INF/views/student/subjectlist.jsp").forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
