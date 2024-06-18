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
public class UserDTO {
	
	private String user_id; //아이디
	private String user_name; //이름
	private String pw; //비밀번호
	private String nick_name; //닉네임
	private String email; //이메일
	private String phone_number; //전화번호
	private String zip_code; //우편번호
	private String address; //도로명주소
	private String address_detail; //상세주소
	private String profile_image; //프로필사진
	private int pnt; //포인트
	private String accnt; //계좌
	private int user_tier; //등급
	private int recommend; //추천수
	private int is_admin; //관리자
	private int auction_alarm_phone; //경매전화알림동의
	private int auction_alarm_email; //경매메일알림동의
	private int comm_alarm_phone; //게시판전화알림동의
	private int comm_alarm_email; //게시판메일알림동의
	
}
