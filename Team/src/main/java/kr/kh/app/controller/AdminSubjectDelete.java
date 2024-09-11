package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.service.SubjectService;
import kr.kh.app.service.SubjectServiceImp;

@WebServlet("/admin/subjectdelete")
public class AdminSubjectDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SubjectService subjectService = new SubjectServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String su_num = request.getParameter("su_num");
		
		if(subjectService.deleteSubject(su_num))
		{
			request.setAttribute("msg", "성공적으로 삭제되었습니다.");
			request.setAttribute("url", "/admin/subjectlist");
		}else {
			request.setAttribute("msg", "삭제 실패되었습니다.");
			request.setAttribute("url", "/admin/subjectlist");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
