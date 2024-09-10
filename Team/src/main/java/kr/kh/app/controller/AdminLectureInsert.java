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
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.service.SubjectService;
import kr.kh.app.service.SubjectServiceImp;

@WebServlet("/admin/lectureinsert")
public class AdminLectureInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SubjectService subjectService = new SubjectServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전공 이름 리스트를 가져옴
		List<SubjectVO> subjectList = subjectService.subjectList();
		
		List<MemberVO> professorList = subjectService.professorList();
		
		request.setAttribute("subjectList", subjectList);
		request.setAttribute("professorList", professorList);
    	
		request.getRequestDispatcher("/WEB-INF/views/admin/lectureinsert.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String su_num = request.getParameter("su_num");
		String le_room = request.getParameter("le_room");
		String le_schedule = request.getParameter("le_schedule");
		String le_year = request.getParameter("le_year");
		String le_semester = request.getParameter("le_semester");
		String le_me_id = request.getParameter("me_id");
		
		
		LectureVO lecture = new LectureVO(su_num, le_room, le_schedule, le_year, le_semester, le_me_id);
		
		System.out.println(lecture);
		
		// 과목 추가 여부에 따른 알림 처리
		if(subjectService.professorSubjectInsert(lecture)) {
			request.setAttribute("msg", "강의 개설에 성공했습니다.");
			request.setAttribute("url", "/admin/subjectlist");
		}else {
			request.setAttribute("msg", "강의 개설에 실패했습니다.");
			request.setAttribute("url", "/admin/lectureinsert");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
	}
}
