package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);
	
	List<MemberVO> perMemberList();

	boolean updateMember(@Param("user")MemberVO user);

	boolean updateMemberPw(@Param("me_id")String me_id, @Param("newPw")String newPw);

	void updateMemberCookie(@Param("user")MemberVO user);

	MemberVO selectMemberBySid(@Param("sid")String sid);

	List<MajorVO> selectMajorList();

	boolean insertUser(@Param("user")MemberVO user);

	boolean insertStudent(@Param("me_id")String me_id, @Param("ma_num")String ma_num);

	boolean insertProfessor(@Param("me_id")String me_id, @Param("ma_num")String ma_num);

	boolean insertAdmin(@Param("me_id")String me_id);

}
