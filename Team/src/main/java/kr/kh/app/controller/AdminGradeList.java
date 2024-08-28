package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.pagination.AdminGradeCriteria;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.GradeService;
import kr.kh.app.service.GradeServiceImp;

@WebServlet("/admin/gradelist")
public class AdminGradeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GradeService gradeService = new GradeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		try {
			String type = request.getParameter("type");
			String search = request.getParameter("search");
			String pageStr = request.getParameter("page");
			int page = 1;
			if(pageStr != null && pageStr.length() != 0) {
				page = Integer.parseInt(pageStr);
			}
			
			
			Criteria cri = new AdminGradeCriteria(page, 5, search, type);
			PageMaker pm = gradeService.getPageMaker(cri, 3);
			
			List<GradeVO> list = gradeService.getGradeListByAdmin(cri);
			
			request.setAttribute("list", list);
			request.setAttribute("pm", pm);
			request.getRequestDispatcher("/WEB-INF/views/admin/gradelist.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


}
