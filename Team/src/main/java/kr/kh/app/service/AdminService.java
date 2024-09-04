package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;

public interface AdminService {

	boolean insertUser(MemberVO user);

	List<MajorVO> getMajorList();

}
