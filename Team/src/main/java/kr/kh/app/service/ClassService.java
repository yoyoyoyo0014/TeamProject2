package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;

public interface ClassService {

	List<LectureVO> getLectureList(MemberVO user);

}
