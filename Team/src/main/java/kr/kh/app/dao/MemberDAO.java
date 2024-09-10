package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);
	
	List<MemberVO> perMemberList();

	boolean updateMember(@Param("user")MemberVO user);

	boolean updateMemberPw(@Param("me_id")String me_id, @Param("newPw")String newPw);

}
