package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class PointDTO {
	private int pointId; //포인트아이디
	private int amount; //양
	private Date createDate; //생성일
	private String cmt; //코멘트
	private int userId; //아이디
	private int isAdd; //적립,사용여부
}
