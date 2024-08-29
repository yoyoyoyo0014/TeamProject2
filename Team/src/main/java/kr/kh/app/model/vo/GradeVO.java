package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GradeVO {

	private String me_id;
	private String me_name;
	private int le_year;
	private String le_semester;
	private String su_name;
	private int su_point;
	private String co_grade;
	
}
