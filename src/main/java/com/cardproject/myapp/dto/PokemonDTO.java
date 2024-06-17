package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class PokemonDTO {
	private String cardId;
	private String cardName;
	private String cardSort;
	private String cardAttr;
	private String evolution;
	private String cardImage;
}
