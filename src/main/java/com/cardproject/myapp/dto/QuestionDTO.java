package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class QuestionDTO {
	private int questId; //게시물ID
	private String title; //제목
	private String ctt; //내용
	private Date createDate; //작성일
	private int userId; //작성자아이디
	private int isSecret; //비밀글여부
	private String answer; //답글
}
