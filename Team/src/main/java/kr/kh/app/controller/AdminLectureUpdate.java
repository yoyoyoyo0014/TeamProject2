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
import kr.kh.app.service.ClassService;
import kr.kh.app.service.ClassServiceImp;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.SubjectService;
import kr.kh.app.service.SubjectServiceImp;

@WebServlet("/admin/lecture/update")
public class AdminLectureUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	
	private ClassService classService = new ClassServiceImp();
	private SubjectService subjectService = new SubjectServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String le_numStr = request.getParameter("co_le_num");
		
		int le_num =0;
		try {
			le_num = Integer.parseInt(le_numStr);
		}catch (Exception e) {
			
		}
		
		LectureVO lecture = classService.getLecture(le_num);
		
		List<SubjectVO> list = subjectService.getSubjectList();
		List<MemberVO> memList = memberService.perMemberList();
		
		request.setAttribute("lec", lecture);
		request.setAttribute("list", list);
		request.setAttribute("meList", memList);
		System.out.println("교수 : " + memList);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/lectureupdate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String numStr = request.getParameter("le_num");
		String room = request.getParameter("le_room");
		String schedule = request.getParameter("le_schedule");
		String semester = request.getParameter("le_semester");
		String subjectNumStr = request.getParameter("le_subject");
		String professorMemId = request.getParameter("le_professor");
		
		int num = 0;
		int subjectNum = 0;
		try {
			num =  Integer.parseInt(numStr);
			subjectNum = Integer.parseInt(subjectNumStr);
		}catch(Exception e) {
			
		}
		LectureVO lec = new LectureVO(num,room,schedule,semester,subjectNum,professorMemId);
		
		if(classService.updateLecture(lec)) {
			request.setAttribute("msg", " 추가 성공했습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}else {
			request.setAttribute("msg", " 추가 실패했습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
