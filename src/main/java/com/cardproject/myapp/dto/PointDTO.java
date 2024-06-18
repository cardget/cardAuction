package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class PointDTO {
	private int point_id; //포인트아이디
	private int amount; //양
	private Date create_date; //생성일
	private String cmt; //코멘트
	private int user_id; //아이디
	private int is_add; //적립,사용여부
}
