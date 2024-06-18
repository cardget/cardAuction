package com.cardproject.myapp.dto;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatRoomDTO {
	private int chat_id;
	private int trade_id;
	private int sender_id;
	private String message;
	private Date create_time;
	private int is_checked;
}
