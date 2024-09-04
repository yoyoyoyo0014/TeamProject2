package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;

public interface SubjectService {

	List<SubjectVO> getSubjectList();

	List<SubjectVO> getSubjectStatusList();

	List<SubjectVO> subjectSuMaNumList();

	boolean subjectInsert(SubjectVO subject);

	List<SubjectVO> getSubjectLectureList();

	boolean professorSubjectInsert(LectureVO lecture);

}
