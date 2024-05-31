package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class QuestionDTO {
	private int questId;
	private String title;
	private String ctt;
	private Date createDate;
	private int userId;
	private int isSecret;
	private String answer;
}
