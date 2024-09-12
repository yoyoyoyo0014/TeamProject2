package kr.kh.app.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO member);

	List<MemberVO> perMemberList();

	boolean updateMember(MemberVO user);

	MemberVO getMember(MemberVO user);

	boolean updateMemberPw(MemberVO user, String newPw);

	Cookie createCookie(MemberVO user, HttpServletRequest request);

	MemberVO getMemberBySid(String sid);

	List<MajorVO> getMajorList();

	boolean insertUser(MemberVO user, String ma_num);

}
