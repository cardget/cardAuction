package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class ReplieDTO {
	private int reply_id; //아이디
	private String cmt; //내용
	private Date create_time; //작성시간
	private int comm_id; //원글아이디
	private int user_id; //답글아이디
}
