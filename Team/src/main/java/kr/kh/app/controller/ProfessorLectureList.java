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

@WebServlet("/professor/lecturelist")
public class ProfessorLectureList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClassService classService = new ClassServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		String type = request.getParameter("type");
		String pageStr = request.getParameter("page");
		String search = request.getParameter("search");
		
		if(type ==null || checkEqualsString(type, "all","className","year"
				,"semester","classsTime","classRoom")) 
			type = "all";
		
		search = search ==null ? "" : search;
		int page = 0;
		try {
			page = Integer.parseInt(pageStr);
		}catch(Exception e) {
			page = 1;
		}
		Criteria cri = new LectureCriteria(page,4,search,user.getMe_id(),type);
		
		//PageMaker pm = classService.getPageMaker(cri,user,2);
		
		//List<LectureVO> list = classService.getLectureList(user, cri);
		
		
		//request.setAttribute("list", list);
		//request.setAttribute("pm", pm);
		//System.out.println("start page" + pm.getStartPage() + "end Page" + pm.getEndPage());
		request.getRequestDispatcher("/WEB-INF/views/professor/lecturelist.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	static boolean checkEqualsString(String A, String... B) {
		for(String str : B) {
			if(A.equals(str))
				return true;
		}
		return false;
	}
}
