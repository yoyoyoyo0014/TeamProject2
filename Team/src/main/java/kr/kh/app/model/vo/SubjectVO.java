package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SubjectVO {

	private int su_num; // 과목번호
	private String su_name; // 과목명(과목이름)
	private int su_time; // 시수
	private int su_point; // 학점
	private String su_status; // 전공여부
	private int su_ma_num; // 전공번호
	
	private MajorVO major;

	public SubjectVO(String su_name, String su_time, String su_point, String su_status, String su_ma_num) {
		this.su_name = su_name;
		try {
			this.su_time = Integer.parseInt(su_time);
			this.su_point = Integer.parseInt(su_point);
			this.su_ma_num = Integer.parseInt(su_ma_num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		this.su_status = su_status;
	}
}
