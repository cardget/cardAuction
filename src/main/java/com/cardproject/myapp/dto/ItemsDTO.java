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
public class ItemsDTO {
	
	private int itemId; //물품아이디
	private String userId; //판매자아이디
	private String itemName; //이름
	private String cmt; //코멘트
	private int status; //물품상태
	private int minPrice; //유찰가
	private String rarity; //희귀도
	private Date createDate; //생성일
	private Date endDate; //마감일
	private int tradeType; //선호거래방식
	private int cat; //카테고리
	private String image1; //이미지
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String dCardId; //카드아이디
	private String pCardId;
	private String yCardId;
	private String sCardId;
	private String oCardId;

}
