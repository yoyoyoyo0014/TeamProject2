package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.service.GradeService;
import kr.kh.app.service.GradeServiceImp;

@WebServlet("/admin/gradelist")
public class AdminGradeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GradeService gradeService = new GradeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String search = request.getParameter("search");		
		
        List<GradeVO> list = gradeService.getGradeListByAdmin(type, search);

        request.setAttribute("list", list);
        request.setAttribute("type", type);
        request.setAttribute("search", search);
		request.getRequestDispatcher("/WEB-INF/views/admin/gradelist.jsp").forward(request, response);
	}


}
