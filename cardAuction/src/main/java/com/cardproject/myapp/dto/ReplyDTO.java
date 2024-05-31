package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class ReplyDTO {
	private int replyId;
	private String cmt;
	private int commId;
	private Date createTime;
	private int userId;
}
