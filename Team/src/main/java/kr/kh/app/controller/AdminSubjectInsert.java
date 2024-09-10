package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.Subject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.service.SubjectService;
import kr.kh.app.service.SubjectServiceImp;

@WebServlet("/admin/subjectinsert")
public class AdminSubjectInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SubjectService subjectService = new SubjectServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 전공번호(넘버) 리스트를 가져옴
    	List<SubjectVO> subjectSuMaNumList = subjectService.subjectSuMaNumList();
    	request.setAttribute("suMaNumList", subjectSuMaNumList);
    	
		// 전공여부(이름) 리스트를 가져옴
		List<SubjectVO> subjectStatusList = subjectService.getSubjectStatusList();
    	request.setAttribute("statusList", subjectStatusList);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/subjectinsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String su_name = request.getParameter("su_name");
		String su_time = request.getParameter("su_time");
		String su_point = request.getParameter("su_point");
		String su_status = request.getParameter("su_status");
		String su_ma_num = request.getParameter("su_ma_num");
		
		SubjectVO subject = new SubjectVO(su_name, su_time, su_point, su_status, su_ma_num);
		
		// 과목 추가 여부에 따른 알림 처리
		if(subjectService.subjectInsert(subject)) {
			request.setAttribute("msg", "과목 추가에 성공했습니다.");
			request.setAttribute("url", "/admin/subjectlist");
		}else {
			request.setAttribute("msg", "과목 추가에 실패했습니다.");
			request.setAttribute("url", "/admin/subjectinsert");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
	}
}
