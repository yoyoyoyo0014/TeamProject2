package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;

public interface SubjectDAO {

	List<SubjectVO> selectSubjectList();

	List<MemberVO> professorList();

}
