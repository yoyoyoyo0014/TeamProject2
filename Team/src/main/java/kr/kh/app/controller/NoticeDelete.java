package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.NoticeService;
import kr.kh.app.service.NoticeServiceImp;

@WebServlet("/notice/delete")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no_num = request.getParameter("no_num");
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		boolean res = noticeService.deleteNotice(no_num, user);
		
		if(res) {
			request.setAttribute("msg",	"공지사항을 삭제하였습니다.");
			request.setAttribute("url", "/notice/list");
		} else {
			request.setAttribute("msg",	"공지사항 삭제에 실패하였습니다.");
			request.setAttribute("url", "/notice/detail?no_num=" + no_num);
		}

		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}


}
