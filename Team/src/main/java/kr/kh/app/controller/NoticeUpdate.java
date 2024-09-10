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

@WebServlet("/notice/update")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no_num = request.getParameter("no_num");
		NoticeVO notice = noticeService.getNotice(no_num);
		
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/WEB-INF/views/notice/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String no_num = request.getParameter("no_num");
		String no_title = request.getParameter("no_title");
		String no_content = request.getParameter("no_content");
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		NoticeVO notice = new NoticeVO(no_num, no_title, no_content, user);
				
		boolean res = noticeService.updateNotice(notice);
		
		if(res) {
			request.setAttribute("msg",	"공지사항을 수정하였습니다.");
			request.setAttribute("url", "/notice/detail?no_num=" + no_num);
		} else {
			request.setAttribute("msg",	"공지사항 수정에 실패하였습니다.");
			request.setAttribute("url", "/notice/detail?no_num=" + no_num);
		}

		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
