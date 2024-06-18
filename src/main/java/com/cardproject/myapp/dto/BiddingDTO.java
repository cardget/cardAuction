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
public class BiddingDTO {
	private int bid_id; //입찰 아이디
	private int price; //입찰 금액
	private Timestamp bid_time; //입찰 시간
	private String user_id; //입찰자 아이디
	private int item_id; //물품 아이디
	
}
