package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.AdminService;
import kr.kh.app.service.AdminServiceImp;

@WebServlet("/admin/insertUser")
public class AdminInsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MajorVO> list = adminService.getMajorList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/admin/insertUser.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String me_id = request.getParameter("me_id");
		String me_name = request.getParameter("me_name");
        String me_email = request.getParameter("me_email");
        String me_authority = request.getParameter("me_authority");
        String ma_num = request.getParameter("major");
        MemberVO user = new MemberVO(me_id, me_name, me_email, me_authority, ma_num);
        System.out.println(user);
        boolean success = adminService.insertUser(user);
        
		if(success) {
			request.setAttribute("msg", "사용자 등록에 성공했습니다.");
			request.setAttribute("url", "/main");
		}else {
			request.setAttribute("msg", "이미 있는 유저 입니다.");
			request.setAttribute("url", "/admin/insertUser");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}