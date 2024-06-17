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
	private int tradeId; //거래번호
	private String userId; //구매자아이디
	private int itemId; //물품아이디
	private int price; //낙찰금액
	private int tradeType; //거래방식
	private Date createDate; //낙찰일자
	private Date confirmDate; //거래확정일자
	private int isRecommend; //추천여부
	private int stage; //거래현황
}
