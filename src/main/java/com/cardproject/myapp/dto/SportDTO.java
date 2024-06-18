package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SportDTO {
	private String card_id;
	private String card_name;
	private String league;
	private String team;
	private String card_image;
}
