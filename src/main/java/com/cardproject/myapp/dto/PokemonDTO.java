package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PokemonDTO {

	private String card_id; //카드아이디
	private String card_name; //이름
	private String card_sort; //카드종류
	private String feature; //특성
	private String card_type; //카드타입
	private String card_image; //이미지


}
