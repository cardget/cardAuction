package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class ReplieDTO {
	private int replyId; //아이디
	private String cmt; //내용
	private Date createTime; //작성시간
	private int commId; //원글아이디
	private int userId; //답글아이디
}
