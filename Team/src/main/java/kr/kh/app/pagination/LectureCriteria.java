package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LectureCriteria extends Criteria {
	private String me_id;
	private String type; // 검색 타입 (전체검색, 작성자검색, 제목검색등)
	
	public LectureCriteria(String le_num, String pageStr
			, String search, String type, int perPageNum) {
		int page;
		try {
			page = Integer.parseInt(pageStr);
		}catch (Exception e) {
			e.printStackTrace();
			page = 1;
		}
		this.search = search == null? "" :search;
		this.type = type == null? "all" :type;
		this.me_id = le_num;
		this.page = page;
		this.perPageNum = perPageNum;
	}

	public LectureCriteria(int page, int perPageNum, String search, String me_id, String type) {
		super(page, perPageNum, search);
		this.me_id = me_id;
		this.type = type;
	}
	
}
