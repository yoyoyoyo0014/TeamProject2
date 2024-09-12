package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.MemberDAO;
import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;

public class MemberServiceImp implements MemberService {

	private MemberDAO memberDao;
	
	public MemberServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			memberDao = session.getMapper(MemberDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_id() == null || member.getMe_pw() == null) {
			return null;
		}
		
		MemberVO user = memberDao.selectMember(member.getMe_id());
		
		if(user == null) {
			return null;
		}
		
		if(user.getMe_pw().equals(member.getMe_pw())) {
			return user;
		}
		
		return null;
	}
	
	@Override
	public List<MemberVO> perMemberList() {
		return memberDao.perMemberList();
	}

	@Override
	public boolean updateMember(MemberVO user) {
		if(user == null) {
			return false;
		}
		if(!checkPw(user)) {
			return false;
		}
		if(user.getMe_name() == null || user.getMe_name().trim().length() == 0) {
			return false;
		}
		if(user.getMe_email() == null || user.getMe_email().trim().length() == 0) {
			return false;
		}
		try {
			return memberDao.updateMember(user);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private boolean checkPw(MemberVO user) {
		MemberVO checkUser = memberDao.selectMember(user.getMe_id());
		
		return checkUser.getMe_pw().equals(user.getMe_pw());
	}

	@Override
	public MemberVO getMember(MemberVO user) {
		if(user == null) {
			return null;
		}
		return memberDao.selectMember(user.getMe_id());
	}

	@Override
	public boolean updateMemberPw(MemberVO user, String newPw) {
		if(user == null) {
			return false;
		}
		if(user.getMe_pw().equals(newPw)) {
			return false;
		}
		
		return memberDao.updateMemberPw(user.getMe_id(), newPw);
	}

	@Override
	public Cookie createCookie(MemberVO user, HttpServletRequest request) {
		if(user == null)
			return null;
		HttpSession session = request.getSession();
		String me_cookie = session.getId();
		Cookie cookie = new Cookie("AL",me_cookie);
		cookie.setPath("/");
		int time = 60 * 60 * 24 * 7;
		cookie.setMaxAge(time);
		user.setMe_cookie(me_cookie);
		Date date = new Date(System.currentTimeMillis() + time * 1000);
		user.setMe_limit(date);
		memberDao.updateMemberCookie(user);
		return cookie;
	}

	@Override
	public MemberVO getMemberBySid(String sid) {
		return memberDao.selectMemberBySid(sid);
	}

	@Override
	public List<MajorVO> getMajorList() {
		return memberDao.selectMajorList();
	}

	@Override
	public boolean insertUser(MemberVO user, String ma_num) {
		if(user == null ||
			user.getMe_id() == null || user.getMe_id().trim().length() == 0 ||
			user.getMe_name() == null || user.getMe_name().trim().length() == 0 ||
			user.getMe_authority() == null || user.getMe_authority().trim().length() == 0) {
			return false;
		}
		
		try {
			if(!memberDao.insertUser(user)) {
				return false;
			}
			
			switch(user.getMe_authority()) {
			
				case "STUDENT":
					return memberDao.insertStudent(user.getMe_id(), ma_num);
				
				case "PROFESSOR":
					return memberDao.insertProfessor(user.getMe_id(), ma_num);
					
				case "ADMIN":
					return memberDao.insertAdmin(user.getMe_id());
				
				default:
					return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;			
		}
		
	}
}
