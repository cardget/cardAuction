package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class DeckDTO {
	private int deck_id; //덱아이디
	private int cat; //카테고리
	private String deck_title; //이름
	private Date create_date; //생성일자
	private String user_id; //작성자
	private int recommend; //추천수
	private String cmt; //코멘트
}
