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
public class BiddingResultDTO {
	private int bid_id;
	private int price; 
	private Timestamp bid_time;
	private String user_id;
	private int item_id;
	private String end_date;
	private String image1;
	private String item_name;
	private int is_win;
	
}
