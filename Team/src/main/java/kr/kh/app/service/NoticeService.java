package kr.kh.app.service;

import java.util.List;

import kr.kh.app.model.vo.NoticeVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;

public interface NoticeService {

	List<NoticeVO> getNoticeList(Criteria cri);

	PageMaker getPageMaker(Criteria cri, int displayPageNum);

	void updateNoticeView(String no_num);

	NoticeVO getNotice(String no_num);

	boolean insertNotice(NoticeVO notice);

}
