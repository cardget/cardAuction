package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class NotificationDTO {
	private int notificationId;
	private Date createDate;
	private String cmt;
	private int userId;
	private int isRead;
}
