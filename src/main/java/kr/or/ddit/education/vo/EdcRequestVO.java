package kr.or.ddit.education.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EdcRequestVO {

	private String edcAplc  ;  // 교육신청자
	private int edcNo       ;  // 교육번호
	private Date erDate     ;  // 교육신청일자
	private String erStatus ;  
}
