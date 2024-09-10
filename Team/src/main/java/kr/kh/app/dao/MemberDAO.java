package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);	

	boolean insertStudent(@Param("ma_id")String me_id, int ma_num);

	boolean insertProfessor(@Param("ma_id")String me_id, int ma_num);

	boolean insertUser(@Param("user")MemberVO user);

	boolean updateMember(@Param("user")MemberVO user);

	boolean updateMemberPw(@Param("me_id")String me_id, @Param("newPw")String newPw);
	
	List<MemberVO> perMemberList();

}
