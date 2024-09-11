package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
public class MemberVO {

	private String me_id;
	private String me_pw;
	private String me_name;
	private String me_email; 
	private String me_authority;
	private String me_cookie; 
	private Date me_limit; 
	
	public MemberVO(String me_id, String me_pw) {
		this.me_id = me_id;
		this.me_pw = me_pw;
	}

	public MemberVO(String me_id, String me_pw, String me_name, String me_email) {
		this.me_id = me_id;
		this.me_pw = me_pw;
		this.me_name = me_name;
		this.me_email = me_email;
	}
}
