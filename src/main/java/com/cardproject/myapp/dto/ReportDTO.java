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
	private int reportId; //아이디
	private int reason; //신고사유
	private int reportCat; //카테고리
	private String userId; //신고자
	private int itemId; //신고물품
	private int commId; //신고글
	private int replyId; //신고댓글
	
}
