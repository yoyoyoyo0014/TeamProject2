package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;


@WebServlet("/student/lecturelist")
public class StudentLectureList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ClassService classService = new ClassServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		String pageStr = request.getParameter("page");
		String search = request.getParameter("search");
		
		
		search = search == null ? "" : search;
		int page = 0;
		try {
			page = Integer.parseInt(pageStr);
		}catch(Exception e) {
			page = 1;
		}
		Criteria cri = new Criteria(page, 5, search);
		List<CourseVO> courseList = classService.checkCourseStudent(user.getMe_id());
		
		PageMaker pm = classService.getPageMaker(cri,5);
		
		List<LectureVO> list = classService.getLectureListByStudent(cri,user.getMe_id());
				
		
		request.setAttribute("list", list);
		request.setAttribute("pm", pm);
		request.setAttribute("applyLecList", courseList);
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/student/lecturelist.jsp").forward(request, response);
	}

}
