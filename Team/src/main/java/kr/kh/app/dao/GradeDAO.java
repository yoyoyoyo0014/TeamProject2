package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.pagination.Criteria;

public interface GradeDAO {

	List<GradeVO> selectGradeListByStudent(@Param("me_id")String me_id);

	List<GradeVO> selectGradeListByYearAndSemester(@Param("me_id")String me_id, @Param("le_year")String le_year, @Param("le_semester")String le_semester);

	boolean updateGrade(@Param("co_num")String co_num, @Param("co_grade")String co_grade);

	List<GradeVO> selectGradeListByAdmin(@Param("cri")Criteria cri);

	int selectGradeTotalCount(@Param("cri")Criteria cri);

}
