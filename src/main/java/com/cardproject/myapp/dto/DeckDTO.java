package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class DeckDTO {
	private int deckId;
	private int cat;
	private String deckTitle;
	private Date createDate;
	private String userId;
	private int recommend;
	private String cmt;
}
