package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.NoticeVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.NoticeService;
import kr.kh.app.service.NoticeServiceImp;


@WebServlet("/notice/list")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String pageStr = request.getParameter("page");
			int page = 1;
			if(pageStr != null && pageStr.length() != 0) {
				page = Integer.parseInt(pageStr);
			}
			String search = request.getParameter("search");
			
			MemberVO user = (MemberVO)request.getSession().getAttribute("user");
			
			Criteria cri = new Criteria(page, 5, search);
			PageMaker pm = noticeService.getPageMaker(cri, 2);
			
			List<NoticeVO> list = noticeService.getNoticeList(cri);
			
			request.setAttribute("list", list);
			request.setAttribute("pm", pm);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/WEB-INF/views/notice/list.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
