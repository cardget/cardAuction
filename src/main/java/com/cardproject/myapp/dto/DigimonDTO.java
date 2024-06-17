package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DigimonDTO {
	private String cardId;
	private String cardName;
	private String cardSort;
	private String cardAttr;
	private String evolution;
	private String cardImage;
}
