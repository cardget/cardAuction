package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeckSourceDTO {
	private int deck_id; //덱소스아이디
	private String p_card; //카드아이디
	private String o_card;
	private String d_card;
	private String y_card;
	private int is_thumbnail; //썸네일여부
}
