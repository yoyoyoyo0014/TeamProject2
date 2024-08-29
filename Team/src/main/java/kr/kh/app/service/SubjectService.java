package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.SubjectVO;

public interface SubjectService {

	List<SubjectVO> getSubjectList();

	List<SubjectVO> getSubjectsubjectStatusListList();

	List<SubjectVO> subjectSuMaNumList();

	boolean subjectInsert(SubjectVO subject);

}
