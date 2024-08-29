package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoticeVO {

	private int no_num;
	private String no_title;
	private String no_content;
	private Date no_date;
	private int no_view;
	private String no_me_id;
	
	private MemberVO member;
	
	public NoticeVO(String no_title, String no_content, MemberVO user) {
		this.no_title = no_title;
		this.no_content = no_content;
		this.member = user;
	}
	
}
