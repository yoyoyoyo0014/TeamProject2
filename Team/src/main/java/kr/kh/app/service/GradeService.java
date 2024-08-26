package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.model.vo.MemberVO;

public interface GradeService {

	List<GradeVO> getGradeListByStudent(MemberVO user);

	List<GradeVO> getGradeListByYearAndSemester(MemberVO user, String le_year, String le_semester);

}
