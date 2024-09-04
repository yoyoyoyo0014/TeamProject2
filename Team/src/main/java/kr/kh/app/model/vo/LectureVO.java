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


	public LectureVO(String su_num, String le_room, String le_schedule, String le_year, String le_semester, String me_id) {
		this.le_room = le_room;
		this.le_schedule = le_schedule;
		try {
			this.le_su_num = Integer.parseInt(su_num);
			this.le_year = Integer.parseInt(le_year);
		}catch (Exception e) {
			e.printStackTrace();
		}
		this.le_semester = le_semester;
		this.le_me_id = me_id;
	}
}
