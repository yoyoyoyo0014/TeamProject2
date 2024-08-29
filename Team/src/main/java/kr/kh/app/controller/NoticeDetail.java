package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.NoticeVO;
import kr.kh.app.service.NoticeService;
import kr.kh.app.service.NoticeServiceImp;

@WebServlet("/notice/detail")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no_num = request.getParameter("no_num");
		
		noticeService.updateNoticeView(no_num);
		
		NoticeVO notice = noticeService.getNotice(no_num);
		
		request.setAttribute("notice", notice);
		
		request.getRequestDispatcher("/WEB-INF/views/notice/detail.jsp").forward(request, response);
	}


}
