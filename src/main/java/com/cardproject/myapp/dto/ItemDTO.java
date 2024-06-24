package com.cardproject.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ItemDTO {
	
	private int item_id; 
	private String user_id; 
	private String item_name; 
	private String cmt; 
	private int status; //1:최상 2:상 3:중 4:하
	private int min_price; 
	private String rarity; 
	private String create_date; 
	private String end_date; 
	private int trade_type; //1:상관없음 2:직거래 3:중개
	private int cat; // 1:포켓몬 2:원피스 3:디지몬 4:유희왕 5:스포츠
	private String image1; 
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String d_card_id; 
	private String p_card_id;
	private String y_card_id;
	private String s_card_id;
	private String o_card_id;

}
