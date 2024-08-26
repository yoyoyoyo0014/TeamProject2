package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.GradeDAO;
import kr.kh.app.dao.MemberDAO;
import kr.kh.app.model.vo.GradeVO;
import kr.kh.app.model.vo.MemberVO;

public class GradeServiceImp implements GradeService {

	private GradeDAO gradeDao;
	
	public GradeServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			gradeDao = session.getMapper(GradeDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<GradeVO> getGradeListByStudent(MemberVO user) {
		if(user == null) {
			return null;
		}
		
		return gradeDao.selectGradeListByStudent(user.getMe_id());
	}

	@Override
	public List<GradeVO> getGradeListByYearAndSemester(MemberVO user, String le_year, String le_semester) {
		if(user == null) {
			return null;
		}
		return gradeDao.selectGradeListByYearAndSemester(user.getMe_id(), le_year, le_semester);
	}
}
