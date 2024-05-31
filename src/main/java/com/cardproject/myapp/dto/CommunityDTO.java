package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class CommunityDTO {
	private int commId;
	private String title;
	private String tag;
	private String ctt;
	private Date createDate;
	private int userId;
	private int recommend;
	private int views;
	private int cat;
}
