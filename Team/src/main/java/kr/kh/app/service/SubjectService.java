package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

public interface SubjectService {

	List<SubjectVO> getSubjectList();

	List<SubjectVO> getSubjectStatusList();

	List<SubjectVO> subjectSuMaNumList();

	boolean subjectInsert(SubjectVO subject);

	List<SubjectVO> getSubjectLectureList();

	boolean professorSubjectInsert(LectureVO lecture);

	PageMaker getPageMaker(Criteria cri, int displayPageNum);

	List<SubjectVO> getSubjectList(Criteria cri);

	List<SubjectVO> subjectList();

	List<MemberVO> professorList();

}
