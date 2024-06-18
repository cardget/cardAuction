package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class CommunityDTO {
	private int comm_id; //아이디
	private String title; //제목
	private String tag; //태그
	private String ctt; //내용
	private Date create_date; //작성일
	private String user_id; //회원아이디
	private int recommend; //추천수
	private int views; //조회수
	private int cat; //카테고리
}
