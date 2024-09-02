package kr.kh.app.service;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.SubjectDAO;
import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.SubjectVO;

public class SubjectServiceImp implements SubjectService {

	private SubjectDAO subjectDao;
	
	public SubjectServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			subjectDao = session.getMapper(SubjectDAO.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<SubjectVO> getSubjectList() {
		return subjectDao.selectSubjectList();
	}

	@Override
	public List<SubjectVO> getSubjectStatusList() {
		return subjectDao.selectSubjectStatusList();
	}

	@Override
	public List<SubjectVO> subjectSuMaNumList() {
		return subjectDao.subjectSuMaNumList();
	}

	@Override
	public boolean subjectInsert(SubjectVO subject) {
		if(subject == null) {
			return false;
		}
		return subjectDao.subjectInsert(subject);
	}

	@Override
	public List<SubjectVO> getSubjectLectureList() {
		return subjectDao.selectSubjectLectureList();
	}

	@Override
	public boolean professorSubjectInsert(String su_num, String le_room, String le_schedule, String le_year,
			String le_semester, MemberVO user) {
		if(user == null || le_room.trim().length() == 0
				|| le_schedule.trim().length() == 0 || le_year.trim().length() == 0
				|| le_semester.trim().length() == 0) {
			return false;
		}
		return subjectDao.professorSubjectInsert(su_num, le_room, le_schedule, le_year, le_semester, user.getMe_id());
	}

}
