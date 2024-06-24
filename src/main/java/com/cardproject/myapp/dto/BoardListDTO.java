package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class BoardListDTO {
	private int comm_id;
	private String tag;
	private int cat;
	private String title;
	private String ctt;
	private String nickname;
	private Date create_date;
	private int recommend;
	private int views;
	private String image;
}
