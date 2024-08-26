package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SubjectVO {
	private int su_num;
	private String su_name;
	private int su_time;
	private int su_point;
	private String su_status;
	private int su_ma_num;
}
