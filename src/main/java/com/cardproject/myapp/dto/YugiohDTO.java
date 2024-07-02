package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class YugiohDTO {
	private String card_id;
	private String card_name;
	private String card_sort;
	private String card_attr;
	private String card_type;
	private int card_level;
	private String card_image;
}
