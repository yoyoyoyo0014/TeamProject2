package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.AdminService;
import kr.kh.app.service.AdminServiceImp;


@WebServlet("/admin/update")
public class AdminUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminService adminService = new AdminServiceImp();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 수정할 유저의 ID
        String me_id = request.getParameter("me_id");
        // 수정할 이름, 비밀번호, 이메일
        String me_name = request.getParameter("me_name");
        String me_pw = request.getParameter("me_pw");
        String me_email = request.getParameter("me_email");

        try {
            // 로그인된 관리자 정보를 가져옴
            MemberVO user = (MemberVO) request.getSession().getAttribute("user");

            // 관리자 권한 확인
            if (user != null && "ADMIN".equals(user.getMe_authority())) {
                // 유저 정보 업데이트 요청
                if (adminService.updateUser(me_id, me_name, me_pw, me_email, user)) {
                    request.setAttribute("msg", "유저 정보를 성공적으로 수정했습니다.");
                } else {
                    throw new RuntimeException();
                }
            } else {
                request.setAttribute("msg", "권한이 없습니다. 관리자만 수정 가능합니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "유저 정보를 수정하지 못했습니다.");
        }
        
        // 메시지와 리다이렉트할 URL 설정
        request.setAttribute("url", "/admin/update");
        request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
    }
}
