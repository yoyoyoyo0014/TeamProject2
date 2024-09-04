package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;

public interface ClassDAO {

	List<LectureVO> selectLectureList(@Param("me_id")String me_id);

	List<CourseVO> selectStudentList(@Param("le_num")String le_num);

	List<MajorVO> selectMajorList();

	boolean insertStudent(@Param("ma_id")String me_id, int ma_num);

	boolean insertProfessor(@Param("ma_id")String me_id, int ma_num);

	boolean insertUser(@Param("user")MemberVO user);

}
