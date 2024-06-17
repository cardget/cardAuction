package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeckSourceDTO {
	private int deckId;
	private String pCard;
	private String oCard;
	private String dCard;
	private String yCard;
	private int isThumbnail;
}
