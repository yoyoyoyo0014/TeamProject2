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
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

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
	public boolean professorSubjectInsert(LectureVO lecture) {
		if(lecture.getLe_me_id() == null || lecture.getLe_room().trim().length() == 0
				|| lecture.getLe_schedule().trim().length() == 0 || lecture.getLe_year() == 0
				|| lecture.getLe_semester().trim().length() == 0) {
			return false;
		}
		return subjectDao.professorSubjectInsert(lecture);
	}

	@Override
	public List<SubjectVO> getSubjectList(Criteria cri) {
		if(cri == null) {
			throw new RuntimeException();
		}
		return subjectDao.selectSubjectList(cri);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri, int displayPageNum) {
		if(cri == null) {
			throw new RuntimeException();
		}
		int totalCount = subjectDao.selectSubjectTotalCount(cri);
		return new PageMaker(totalCount, displayPageNum, cri);
	}

	@Override
	public List<SubjectVO> subjectList() {
		return subjectDao.subjectList();
	}

	@Override
	public List<MemberVO> professorList() {
		return subjectDao.professorList();
	}

}
