package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class NotificationDTO {
	private int notification_id; //알림
	private String cmt; //내용
	private String user_id; //수신자
	private Date create_date; //작성일
	private int is_read; //읽기여부
	private int item_id; //물품아이디
	
}
