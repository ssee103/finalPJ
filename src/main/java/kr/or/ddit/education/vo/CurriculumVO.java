package kr.or.ddit.education.vo;

import lombok.Data;

@Data
public class CurriculumVO {

	private int curNo       ;  // 커리큘럼번호
	private int edcNo       ;  // 교육번호
	private String curName  ;  // 커리큘럼명
	private int curSort     ;  // 분류코드
}
