package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO member);

	List<MemberVO> perMemberList();

	boolean updateMember(MemberVO user);

	MemberVO getMember(MemberVO user);

	boolean updateMemberPw(MemberVO user, String newPw);

}
