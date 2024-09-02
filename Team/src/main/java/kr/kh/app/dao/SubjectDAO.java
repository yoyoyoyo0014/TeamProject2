package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.SubjectVO;

public interface SubjectDAO {

	List<SubjectVO> selectSubjectList();

	List<SubjectVO> selectSubjectStatusList();

	List<SubjectVO> subjectSuMaNumList();

	boolean subjectInsert(@Param("su")SubjectVO subject);

	List<SubjectVO> selectSubjectLectureList();

	boolean professorSubjectInsert(
			@Param("su_num")String su_num, @Param("le_room")String le_room
			, @Param("le_schedule")String le_schedule, @Param("le_year")String le_year
			, @Param("le_semester")String le_semester, @Param("me_id")String me_id);

}
