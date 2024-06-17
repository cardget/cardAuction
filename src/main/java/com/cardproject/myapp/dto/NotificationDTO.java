package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class NotificationDTO {
	private int notificationId; //알림
	private String cmt; //내용
	private String userId; //수신자
	private Date createDate; //작성일
	private int isRead; //읽기여부
	private int itemId; //물품아이디
	
}
