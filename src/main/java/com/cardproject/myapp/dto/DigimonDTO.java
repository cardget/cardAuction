package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DigimonDTO {
	private String card_id;
	private String card_name;
	private String card_sort;
	private String card_attr;
	private String evolution;
	private String cardImage;
	private String card_color;
	private String monster_type;
	private String card_cost;
}
