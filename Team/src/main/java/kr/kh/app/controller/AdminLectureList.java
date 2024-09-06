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
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.LectureCriteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;

@WebServlet("/admin/lecturelist")
public class AdminLectureList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ClassService classService = new ClassServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		String pageStr = request.getParameter("page");
		String search = request.getParameter("search");
		
		
		
		search = search ==null ? "" : search;
		int page = 0;
		try {
			page = Integer.parseInt(pageStr);
		}catch(Exception e) {
			page = 1;
		}
		Criteria cri = new Criteria(page, 5, search);
		
		PageMaker pm = classService.getPageMaker(cri,2);
		
		List<LectureVO> list = classService.getLectureListByStudent(cri,user.getMe_id());
		
		
		request.setAttribute("list", list);
		request.setAttribute("pm", pm);
		//System.out.println("start page" + pm.getStartPage() + "end Page" + pm.getEndPage());
		request.getRequestDispatcher("/WEB-INF/views/admin/lecturelist.jsp").forward(request, response);
	}
	static boolean checkEqualsString(String A, String... B) {
		for(String str : B) {
			if(A.equals(str))
				return true;
		}
		return false;
	}
}
