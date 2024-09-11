package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

public interface SubjectService {

	List<SubjectVO> getSubjectStatusList();

	List<SubjectVO> subjectSuMaNumList();

	boolean subjectInsert(SubjectVO subject);

	List<SubjectVO> getSubjectLectureList();

	boolean lectureInsert(LectureVO lecture);

	PageMaker getPageMaker(Criteria cri, int displayPageNum);

	List<SubjectVO> getSubjectList(Criteria cri);

	List<SubjectVO> subjectList();

	List<MemberVO> professorList();

	boolean deleteSubject(String su_num);

	List<SubjectVO> subjectList(String su_num);

	boolean subjectUpdate(SubjectVO subject);

	SubjectVO getSubject(String su_name);

}
