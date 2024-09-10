package kr.kh.app.dao;

import java.util.List;

<<<<<<< HEAD
=======
import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
>>>>>>> main
import kr.kh.app.model.vo.SubjectVO;

public interface SubjectDAO {

	List<SubjectVO> selectSubjectList();

	List<MemberVO> professorList();

}
