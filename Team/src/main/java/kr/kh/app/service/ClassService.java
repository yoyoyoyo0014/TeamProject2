package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

public interface ClassService {

	List<LectureVO> getLectureListByProfessor(MemberVO user);
	
	List<LectureVO> getLectureListByStudent(Criteria cri,String me_id);

	List<CourseVO> getStudentList(String le_num);

	PageMaker getPageMaker(Criteria cri, int displayNum);

	List<LectureVO> getLectureListByStudent(Criteria cri);

	boolean deleteCourse(int coNum);

	LectureVO getLecture(int le_num);

	boolean deleteSubject(int le_su_num);

	boolean deleteLecture(int le_num);

	boolean insertLec(LectureVO lec);

	boolean updateLecture(LectureVO lec);

	boolean insertCourse(int coLeNum, String id);

	List<CourseVO> checkCourseStudent(String me_id);

}
