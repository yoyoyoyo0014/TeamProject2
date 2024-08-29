package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.NoticeVO;
import kr.kh.app.service.NoticeService;
import kr.kh.app.service.NoticeServiceImp;

@WebServlet("/notice/insert")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/notice/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no_title = request.getParameter("no_title");
		String no_content = request.getParameter("no_content");
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		NoticeVO notice = new NoticeVO(no_title, no_content, user);
		
		boolean res = noticeService.insertNotice(notice);
		
		if(res) {
			request.setAttribute("msg",	"공지사항을 등록했습니다.");
			request.setAttribute("url", "/notice/list");
		} else {
			request.setAttribute("msg",	"공지사항 등록에 실패했습니다.");
			request.setAttribute("url", "/notice/list");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
		doGet(request, response);
	}

}
