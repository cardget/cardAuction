package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class CommunityDTO {
	private int commId; //아이디
	private String title; //제목
	private String tag; //태그
	private String ctt; //내용
	private Date createDate; //작성일
	private int userId; //회원아이디
	private int recommend; //추천수
	private int views; //조회수
	private int cat; //카테고리
}
