package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.NoticeVO;
import kr.kh.app.pagination.Criteria;

public interface NoticeDAO {

	List<NoticeVO> selectNoticeList(@Param("cri")Criteria cri);

	int selectNoticeTotalCount(@Param("cri")Criteria cri);

	void updateNoticeView(@Param("no_num")String no_num);

	NoticeVO selectNotice(@Param("no_num")String no_num);

}
