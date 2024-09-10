package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {

	private String me_id;
	private String me_pw;
	private String me_name;
	private String me_email; 
	private String me_authority;
	private int ma_num;
	
	public MemberVO(String me_id, String me_pw) {
		this.me_id = me_id;
		this.me_pw = me_pw;
	}

<<<<<<< HEAD
	public MemberVO(String me_id, String me_name, String me_email, String me_authority, String ma_num) {
		this.me_id = me_id;
		this.me_name = me_name;
		this.me_email = me_email;
		this.me_authority = me_authority;
		try {
			this.ma_num = Integer.parseInt(ma_num);
		}catch (Exception e) {
			e.printStackTrace();
		}
=======
	public MemberVO(String me_id, String me_pw, String me_name, String me_email) {
		this.me_id = me_id;
		this.me_pw = me_pw;
		this.me_name = me_name;
		this.me_email = me_email;
>>>>>>> main
	}
}
