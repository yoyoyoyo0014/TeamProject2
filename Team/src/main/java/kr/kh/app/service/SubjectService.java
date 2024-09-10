package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.SubjectVO;

public interface SubjectService {
<<<<<<< HEAD
<<<<<<< Updated upstream

	List<SubjectVO> getSubjectList();
=======
=======
>>>>>>> main
	
	List<SubjectVO> getSubjectStatusList();

	List<SubjectVO> subjectSuMaNumList();

	boolean subjectInsert(SubjectVO subject);

	List<SubjectVO> getSubjectLectureList();

	boolean professorSubjectInsert(LectureVO lecture);

	PageMaker getPageMaker(Criteria cri, int displayPageNum);

	List<SubjectVO> getSubjectList(Criteria cri);

	List<SubjectVO> subjectList();

	List<MemberVO> professorList();
<<<<<<< HEAD
>>>>>>> Stashed changes
=======
>>>>>>> main

}
