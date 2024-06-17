package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SportDTO {
	private String cardId;
	private String cardName;
	private String league;
	private String team;
	private String cardImage;
}
