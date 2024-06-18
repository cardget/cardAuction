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
public class ReportDTO {
	private int report_id; //아이디
	private int reason; //신고사유
	private int report_cat; //카테고리
	private String user_id; //신고자
	private int item_id; //신고물품
	private int comm_id; //신고글
	private int reply_id; //신고댓글
	
}
