package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.ClassDAO;
import kr.kh.app.dao.GradeDAO;
import kr.kh.app.model.vo.CourseVO;
import kr.kh.app.model.vo.LectureVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.LectureCriteria;

public class ClassServiceImp implements ClassService {

	private ClassDAO classDao;
	
	public ClassServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			classDao = session.getMapper(ClassDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<CourseVO> getStudentList(String le_num) {
		return classDao.selectStudentList(le_num);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri,MemberVO user, int displayNum) {
		if(cri == null) {
			throw new RuntimeException();
		}
		int totalCount = classDao.selectLectureTotalCount(cri,user);
		return  new PageMaker(totalCount,displayNum,cri);
	}


	@Override
	public List<LectureVO> getLectureList(MemberVO user, Criteria cri) {
		if(user == null) {
			return null;
		}
		return classDao.selectLectureList(user.getMe_id(),cri);
	}

	



	



	

	
}
