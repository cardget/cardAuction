package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QuestionDTO {
	private int quest_id; // 문의 번호
	private String title; // 제목
	private String ctt; // 내용
	private Date create_date; // 생성일자
	private String user_id; // 글쓴이
	/*
	 * checkbox가 null 또는 on으로 오는 경우 
	 * controller에서 0또는 1로 변환하기 위해 
	 * null값 비교가 가능한 Integer타입으로 선언 
	 */
	private Integer is_secret; // 비밀글 여부
	private String image; // 이미지
	private String answer; // 답변
	private String nickname; // 닉네임 조회 필요
	private int answer_exist;
}
