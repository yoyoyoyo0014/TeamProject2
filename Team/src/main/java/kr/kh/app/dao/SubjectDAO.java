package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.pagination.Criteria;

public interface SubjectDAO {

	List<SubjectVO> selectSubjectList(@Param("cri")Criteria cri);

	List<SubjectVO> selectSubjectStatusList();

	List<SubjectVO> subjectSuMaNumList();

	boolean subjectInsert(@Param("su")SubjectVO subject);

	List<SubjectVO> selectSubjectLectureList();

	boolean professorSubjectInsert(@Param("le")LectureVO lecture);

	int selectSubjectTotalCount(@Param("cri")Criteria cri);

	List<SubjectVO> subjectList();

	List<MemberVO> professorList();

}
