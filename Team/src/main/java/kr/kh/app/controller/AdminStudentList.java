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

@WebServlet("/admin/studentlist")
public class AdminStudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ClassService classService = new ClassServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String leNumStr = request.getParameter("le_num");
		String su_name = request.getParameter("su_name");
		
		List<CourseVO> list = classService.getStudentList(leNumStr);
		System.out.println(list);
		//request.setAttribute("co_le_num", );
		if(list == null || list.size()==0) 
			request.setAttribute("co_le_num", "");
		else
			request.setAttribute("co_le_num", list.get(list.size()-1).getCo_le_num());
		request.setAttribute("list", list);
		request.setAttribute("su_name", su_name);
		request.getRequestDispatcher("/WEB-INF/views/admin/studentlist.jsp").forward(request, response);
	
	}
}
