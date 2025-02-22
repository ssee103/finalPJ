package kr.or.ddit.education.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EducationVO {
    
    private String edcNo;       // 교육번호
    private String edcSort;     // 교육분류
    private String edcWay;      // 교육방식
    private String educator;    // 교육자
    private String edcTarget;   // 교육대상
    private String edcGrade;    // 교육예상직급
    private int edcPsncpa;      // 교육정원
    private String edcTitle;    // 프로그램명
    private String edcContent;  // 프로그램내용
    private Date recruitSdate;  // 모집시작일자
    private Date recruitEdate;  // 모집종료일자
    private Date edcSdate;      // 교육시작일자
    private Date edcEdate;      // 교육종료일자
    private String edcActive;   // 교육활성화여부
    private int edcBookNo  ;    // 교재번호   <-> bookNo
    
    // EMP_EDC랑 연결
    private String eeStatus;    // 신청상태
    private String eeCdate;     // 수강신청일
    private String emplNo;
    
    // EDC_BOOK랑 연결
    private String bookNo;         // ISBN 
    private String bookName;       // 책 제목
    private int bookPrice;         // 책 가격
    private String bookCompany;    // 출판사
    
    // CURRICULLUM
    private int curNo       ;  // 커리큘럼번호
	private String curName  ;  // 커리큘럼명
	private int curSort     ;  // 분류코드
    
    
    
    // 날짜 포맷
    private String recruitSdateFormatted;
    private String recruitEdateFormatted;
    private String edcSdateFormatted;
    private String edcEdateFormatted;
    private String eeCdateFormatted; // 수강신청일 포맷

    public void setRecruitSdateFormatted(String format) {
        this.recruitSdateFormatted = format;
    }
    public void setRecruitEdateFormatted(String format) {
        this.recruitEdateFormatted = format;
    }
    public void setEdcSdateFormatted(String format) {
        this.edcSdateFormatted = format;
    }
    public void setEdcEdateFormatted(String format) {
        this.edcEdateFormatted = format;
    }
    public void setEeCdateFormatted(String format) {
        this.eeCdateFormatted = format;
    }
}
