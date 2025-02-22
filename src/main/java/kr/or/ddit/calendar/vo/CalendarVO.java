package kr.or.ddit.calendar.vo;


import java.util.Date;

import lombok.Data;

@Data
public class CalendarVO {

	private int schNo;
	private String emplNo;
	private String groupId;
	private String schTitle;
	private Date schSDate;
	private Date schEDate;
	private String schColor;
	private String schTextColor;
	private boolean schAllDay; //하루종일 여부
	
}
