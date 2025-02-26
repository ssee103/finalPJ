package kr.or.ddit.education.vo;

import lombok.Data;

@Data
public class CurriculumVO {

	private int curNo;            // 커리큘럼 NO
	private int edcNo;            // 교육번호(educationVO와 연결)
	private String curName;       // 커리큘럼명
	private String curUrl;        // 해당 커리큘럼의 URL
	private String curExplain;    // 해당 커리큘럼 설명
}
