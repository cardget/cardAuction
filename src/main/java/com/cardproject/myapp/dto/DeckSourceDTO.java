package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class DeckSourceDTO {
	private int deckId; //덱아이디
	private String pCard; //카드아이디
	private String oCard;
	private String dCard;
	private String yCard;
	private int isThumbnail; //썸네일여부
}
