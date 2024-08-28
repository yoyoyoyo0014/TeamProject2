package kr.kh.app.pagination;

import lombok.Data;

@Data
public class AdminGradeCriteria extends Criteria{

	private String type;
	
	public AdminGradeCriteria(int page, int perPageNum, String search, String type) {
		super(page, perPageNum, search);
		this.type = type;
	}
}
