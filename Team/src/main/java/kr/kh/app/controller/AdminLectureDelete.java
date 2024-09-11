package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;


@WebServlet("/admin/lecturedelete")
public class AdminLectureDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ClassService classService = new ClassServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String le_numStr = request.getParameter("co_le_num");
		
		
		
		
		int le_num = 0;
		LectureVO lecVo = null;
		try {
			le_num = Integer.parseInt(le_numStr);
			lecVo = classService.getLecture(le_num);
			classService.deleteCourse(le_num);
			//coNum = Integer.parseInt(coNumStr);
		}catch(Exception e) {
			request.setAttribute("msg", "삭제 실패되었습니다.");
			request.setAttribute("url", "/admin/lecturelist");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		if(classService.deleteLecture(le_num))
		{
			request.setAttribute("msg", "성공적으로 삭제되었습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}else {
			request.setAttribute("msg", "삭제 실패되었습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
