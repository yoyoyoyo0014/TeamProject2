package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

public interface SubjectService {

	List<SubjectVO> getSubjectStatusList();

	List<MajorVO> subjectSuMaNumList();

	boolean subjectInsert(SubjectVO subject);

	List<SubjectVO> getSubjectLectureList();

	boolean lectureInsert(LectureVO lecture);

	PageMaker getPageMaker(Criteria cri, int displayPageNum);

	List<SubjectVO> getSubjectList(Criteria cri);

	List<SubjectVO> subjectList();

	List<MemberVO> professorList();

	boolean deleteSubject(String su_num);

	SubjectVO getSubjectByNum(String su_num);

	boolean subjectUpdate(SubjectVO subject);

	SubjectVO getSubjectByName(String su_name);

}
