package kr.kh.app.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.service.SubjectService;
import kr.kh.app.service.SubjectServiceImp;

@WebServlet("/admin/subjectupdate")
public class AdminSubjectUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SubjectService subjectService = new SubjectServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 화면에서 넘겨준 su_num 값을 가져옴
		String su_num = request.getParameter("su_num");

		// 전공여부(이름) 리스트를 가져옴
		List<MajorVO> majorList = subjectService.subjectSuMaNumList();
		List<SubjectVO> subjectStatusList = subjectService.getSubjectStatusList();
		SubjectVO subject = subjectService.getSubjectByNum(su_num);
		
		
		request.setAttribute("majorList", majorList);
		request.setAttribute("statusList", subjectStatusList);
		request.setAttribute("subject", subject);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/subjectupdate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String suNum = request.getParameter("su_num");
		String su_name = request.getParameter("su_name");
		String su_time = request.getParameter("su_time");
		String su_point = request.getParameter("su_point");
		String su_status = request.getParameter("su_status");
		String su_ma_num = request.getParameter("su_ma_num");
		
		int su_num = 0;
		try {
			su_num = Integer.parseInt(suNum);
		}catch (Exception e) {
			
		}
		
		SubjectVO subject = new SubjectVO(su_num, su_name, su_time, su_point, su_status, su_ma_num);
		
		SubjectVO checkSubject = subjectService.getSubjectByName(su_name);
		if(checkSubject != null) {
			request.setAttribute("msg", "이미 존재하는 과목 이름입니다.");
			request.setAttribute("url", "/admin/subjectupdate?su_num="+su_num);
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		// 과목 추가 여부에 따른 알림 처리
		if(subjectService.subjectUpdate(subject)) {
			request.setAttribute("msg", "과목 수정에 성공했습니다.");
			request.setAttribute("url", "/admin/subjectlist");
		}else {
			request.setAttribute("msg", "과목 수정에 실패했습니다.");
			request.setAttribute("url", "/admin/subjectupdate?su_num="+su_num);
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
