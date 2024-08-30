package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.LectureCriteria;

public interface ClassService {


	List<CourseVO> getStudentList(String le_num);

	PageMaker getPageMaker(Criteria cri, MemberVO user, int i);

	List<LectureVO> getLectureList(MemberVO user, Criteria cri);

}
