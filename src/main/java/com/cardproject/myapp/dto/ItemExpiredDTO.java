package com.cardproject.myapp.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ItemExpiredDTO {
	private int item_id;
	private String seller_id;
	private String item_name; 
	private String end_date; 
	private int bid_id;
	private int price;
	private Timestamp bid_time; 
	private String customer_id; 
	private int is_win;
}
