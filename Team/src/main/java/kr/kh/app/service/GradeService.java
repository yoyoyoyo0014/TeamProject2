package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

public interface GradeService {

	List<GradeVO> getGradeListByStudent(MemberVO user);

	List<GradeVO> getGradeListByYearAndSemester(MemberVO user, String le_year, String le_semester);

	boolean updateGrade(String co_num, String co_grade);

	List<GradeVO> getGradeListByAdmin(Criteria cri);

	PageMaker getPageMaker(Criteria cri, int i);

}
