package com.cardproject.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminInfoDTO {
	private int userCnt;
	private int signupCnt;
	private int disableCnt;
	private int itemCnt;
	private int registerCnt;
	private int winningCnt;
	private int turnover;
}
