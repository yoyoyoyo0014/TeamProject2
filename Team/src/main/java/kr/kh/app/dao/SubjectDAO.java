package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.pagination.Criteria;

public interface SubjectDAO {

	List<SubjectVO> selectSubjectList(@Param("cri")Criteria cri);

	List<SubjectVO> selectSubjectStatusList();

	List<MajorVO> subjectSuMaNumList();

	boolean subjectInsert(@Param("su")SubjectVO subject);

	List<SubjectVO> selectSubjectLectureList();

	boolean lectureInsert(@Param("le")LectureVO lecture);

	int selectSubjectTotalCount(@Param("cri")Criteria cri);

	List<SubjectVO> subjectList();

	List<MemberVO> professorList();

	boolean deleteSubject(@Param("su_num")String su_num);

	SubjectVO selectSubjectByNum(@Param("su_num")String su_num);

	boolean updateSubject(@Param("su")SubjectVO subject);

	LectureVO getLecture(@Param("le")LectureVO lecture);

	SubjectVO selectSubjectByName(@Param("su_name")String su_name);

}
