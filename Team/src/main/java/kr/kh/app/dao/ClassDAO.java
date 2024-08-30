package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.LectureCriteria;

public interface ClassDAO {

	List<CourseVO> selectStudentList(@Param("le_num")String le_num);

	List<LectureVO> selectLectureList(@Param("me_id")String me_id,@Param("cri") Criteria cri);


	int selectLectureTotalCount(@Param("cri")Criteria cri,@Param("user")MemberVO user);

	boolean insertCourse(@Param("le_num")int coLeNum,@Param("me_id") int coMeId);

	CourseVO selectCourse(@Param("le_num")int coLeNum,@Param("me_id") int coMeId);

	boolean deleteCourse(@Param("co_num")int coNum);

	LectureVO selectLecture(@Param("le_num")int le_num);

	boolean deleteSubject(@Param("su_num")int le_su_num);

	boolean deleteLecture(@Param("le_num")int le_num);

}
