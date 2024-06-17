package com.cardproject.myapp.dto;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatRoomDTO {
	private int chatId;
	private int tradeId;
	private int senderId;
	private String message;
	private Date createTime;
	private int isChecked;
}
