package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class PokemonDTO {
	private String cardId; //카드아이디
	private String cardName; //이름
	private String cardSort; //카드종류
	private String feature; //특성
	private String cardType; //카드타입
	private String cardImage; //이미지
}
