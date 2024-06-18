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
	private int trade_id; //거래번호
	private String user_id; //구매자아이디
	private int item_id; //물품아이디
	private int price; //낙찰금액
	private int trade_type; //거래방식
	private Date create_date; //낙찰일자
	private Date confirm_date; //거래확정일자
	private int is_recommend; //추천여부
	private int stage; //거래현황
}
