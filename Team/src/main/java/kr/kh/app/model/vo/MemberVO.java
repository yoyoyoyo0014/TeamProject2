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
}
