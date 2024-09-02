package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.model.vo.LectureVO;

public interface ClassDAO {

	List<LectureVO> selectLectureList(@Param("me_id")String me_id);

	List<CourseVO> selectStudentList(@Param("le_num")String le_num);

}
