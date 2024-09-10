package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.MemberDAO;
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
			System.out.println("user is null");
			return false;
		}
		if(user.getMe_pw().equals(newPw)) {
			System.out.println("pw same newPw");
			return false;
		}
		
		return memberDao.updateMemberPw(user.getMe_id(), newPw);
	}
}
