package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class YugiohDTO {
	private String cardId;
	private String cardName;
	private String cardSort;
	private String cardAttr;
	private String monsterType;
	private int cardLevel;
	private String cardImage;
}
