package com.cardproject.myapp.dto;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatRoomDTO {
	private int chat_id; //메시지아이디
	private int trade_id; //거래번호
	private int sender_id; //보낸사람아이디
	private String message; //내용
	private Date create_time; //생성시간
	private int is_checked; //확인여부
}
