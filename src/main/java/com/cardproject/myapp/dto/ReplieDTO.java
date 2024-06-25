package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class ReplieDTO {
	private int reply_id; // 답글 아이디
	private String cmt; // 답글 내용
	private Date create_time; // 생성 시간
	private int comm_id; // 게시글 아이디
	private String user_id; // 유저아이디
	private String nickname; // 닉네임
	private String profile_image; // 프로필 이미지
}
