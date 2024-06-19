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
public class ItemDTO {
	
	private int item_id; //물품아이디
	private String user_id; //판매자아이디
	private String item_name; //이름
	private String cmt; //코멘트
	private int status; //물품상태 0:최상 / 1: 상 / 2: 중 / 3: 하
	private int min_price; //유찰가
	private String rarity; //희귀도 C<R<RR<RRR<HR<UR<SAR,CSR등
	private Date create_date; //생성일
	private String end_date; //마감일
	private int trade_type; //선호거래방식 0:상관없음 / 1:직거래 / 2:중개
	private int cat; //카테고리 0:포켓몬 / 1:유희왕 / 2:디지몬 / 3:원피스 / 4:스포츠
	private String image1; //이미지
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String d_card_id; //카드아이디
	private String p_card_id;
	private String y_card_id;
	private String s_card_id;
	private String o_card_id;

}
