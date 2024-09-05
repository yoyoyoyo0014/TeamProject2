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

@WebServlet("/admin/lecture/insert")
public class AdminLectureInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
private MemberService memberService = new MemberServiceImp();
	
	private ClassService classService = new ClassServiceImp();
	private SubjectService subjectService = new SubjectServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<SubjectVO> list = subjectService.getSubjectList();
		List<MemberVO> memList = memberService.perMemberList();
		
		request.setAttribute("list", list);
		request.setAttribute("meList", memList);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/lectureinsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numStr = request.getParameter("num");
		String room = request.getParameter("room");
		String schedule = request.getParameter("schedule");
		String semester = request.getParameter("semester");
		String subjectNumStr = request.getParameter("subject");
		String professorMemId = request.getParameter("professor");
		int num = 0;
		int subjectNum = 0;
		try {
			num =  Integer.parseInt(numStr);
			subjectNum = Integer.parseInt(subjectNumStr);
		}catch(Exception e) {
			
		}
		LectureVO lec = new LectureVO(num,room,schedule,semester,subjectNum,professorMemId);
		if(classService.insertLec(lec)) {
			request.setAttribute("msg", "성공적으로 추가했습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}else {
			request.setAttribute("msg", " 추가 실패했습니다.");
			request.setAttribute("url", "/admin/lecturelist");
		}
		request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
	}

}
