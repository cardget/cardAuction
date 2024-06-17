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
	
	private String userId; //아이디
	private String userName; //이름
	private String pw; //비밀번호
	private String nickName; //닉네임
	private String email; //이메일
	private String phoneNumber; //전화번호
	private String zipCode; //우편번호
	private String address; //도로명주소
	private String addressDetail; //상세주소
	private String profileImage; //프로필사진
	private int pnt; //포인트
	private String accnt; //계좌
	private int userTier; //등급
	private int recommend; //추천수
	private int isAdmin; //관리자
	private int auctionAlarmPhone; //경매전화알림동의
	private int auctionAlarmEmail; //경매메일알림동의
	private int commAlarmPhone; //게시판전화알림동의
	private int commAlarmEmail; //게시판메일알림동의
	
}
