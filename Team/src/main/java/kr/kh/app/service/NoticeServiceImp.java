package kr.kh.app.service;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.NoticeDAO;
import kr.kh.app.model.vo.NoticeVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

public class NoticeServiceImp implements NoticeService{

	private NoticeDAO noticeDao;
	
	public NoticeServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			noticeDao = session.getMapper(NoticeDAO.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<NoticeVO> getNoticeList(Criteria cri) {
		if(cri == null) {
			throw new RuntimeException();
		}
		return noticeDao.selectNoticeList(cri);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri, int displayPageNum) {
		if(cri == null) {
			throw new RuntimeException();
		}
		int totalCount = noticeDao.selectNoticeTotalCount(cri);
		return new PageMaker(totalCount, displayPageNum, cri);
	}

	@Override
	public void updateNoticeView(String no_num) {
		noticeDao.updateNoticeView(no_num);		
	}

	@Override
	public NoticeVO getNotice(String no_num) {
		return noticeDao.selectNotice(no_num);
	}
}
