package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TradeDTO {
	private int trade_id; 
	private String user_id; 
	private int item_id; 
	private int price; 
	private int trade_type; 
	private String create_date; 
	private Date confirm_date; 
	private int is_recommend; 
	private int stage;
	private String image1;
	private String item_name;
	private int is_success;
}
