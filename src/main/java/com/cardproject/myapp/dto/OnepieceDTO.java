package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OnepieceDTO {
	private String cardId;
	private String cardName;
	private String cardSort;
	private String cardAttr;
	private String color;
	private int cardCost;
	private String feature;
	private String cardImage;
}
