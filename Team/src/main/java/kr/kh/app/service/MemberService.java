package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO member);

	List<MemberVO> perMemberList();

}
