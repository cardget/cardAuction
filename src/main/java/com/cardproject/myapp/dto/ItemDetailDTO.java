package com.cardproject.myapp.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ItemDetailDTO {
	private int item_id;
	private String user_id;
	private String item_name;
	private String cmt;
	private int status;
	private int min_price;
	private String rarity;
	private Date create_date;
	private String end_date;
	private int trade_type;
	private int cat;
	private String image1; 
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String nickname;
	private int user_tier;
	private String card_id;
	private String card_name;
	private String card_image;
	private int bid_count;
}
