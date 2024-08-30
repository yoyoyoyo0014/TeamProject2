package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LectureVO {

	private int le_num;
	private String le_room;
	private String le_schedule;
	private int le_year;
	private String le_semester;
	private int le_su_num;
	private String le_me_id;
	
	private SubjectVO subject;
}
