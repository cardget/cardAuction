package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class QuestionDTO {
	private int quest_id; //게시물ID
	private String title; //제목
	private String ctt; //내용
	private Date create_date; //작성일
	private int user_id; //작성자아이디
	private int is_secret; //비밀글여부
	private String answer; //답글
}
