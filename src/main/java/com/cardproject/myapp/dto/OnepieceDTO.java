package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OnepieceDTO {
	private String card_id;
	private String card_name;
	private String card_sort;
	private String card_attr;
	private String color;
	private int card_cost;
	private String feature;
	private String card_image;
}
