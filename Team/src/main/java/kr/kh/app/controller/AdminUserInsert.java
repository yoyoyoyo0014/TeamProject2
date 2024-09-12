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
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

@WebServlet("/admin/userinsert")
public class AdminUserInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MajorVO> list = memberService.getMajorList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/admin/userinsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String me_id = request.getParameter("me_id");
		String me_name = request.getParameter("me_name");
        String me_email = request.getParameter("me_email");
        String me_authority = request.getParameter("me_authority");
        String ma_num = request.getParameter("major");
        
        
        switch(me_authority) {
        	case "STUDENT" :
        		break;
        	case "PROFESSOR" :
        		me_id = "P" + me_id;
        		break;
        	case "ADMIN" :
        		me_id = "A" + me_id;
        		break;
        	default :
    			request.setAttribute("msg", "사용자 등록에 실패했습니다.");
    			request.setAttribute("url", "/admin/userinsert");
    			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
    			return;
        }
        
        
        //생성자 구분을 위한 패스워드값
        String me_pw = "";
        
        MemberVO user = new MemberVO(me_id, me_pw, me_name, me_email, me_authority);
        
        MemberVO checkUser = memberService.getMember(user);
        if(checkUser != null) {
			request.setAttribute("msg", "이미 사용중인 학번입니다.");
			request.setAttribute("url", "/admin/userinsert");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
        }
        
		if(memberService.insertUser(user, ma_num)) {
			request.setAttribute("msg", "사용자 등록에 성공했습니다.");
			request.setAttribute("url", "/notice/list");
		}else {
			request.setAttribute("msg", "사용자 등록에 실패했습니다.");
			request.setAttribute("url", "/admin/userinsert");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
	

}
