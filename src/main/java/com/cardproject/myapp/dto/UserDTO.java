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
	
	private String user_id; //���̵�
	private String user_name; //�̸�
	private String pw; //��й�ȣ
	private String nick_name; //�г���
	private String email; //�̸���
	private String phone_number; //��ȭ��ȣ
	private String zip_code; //�����ȣ
	private String address; //���θ��ּ�
	private String address_detail; //���ּ�
	private String profile_image; //�����ʻ���
	private int pnt; 
	private String accnt; 
	private int user_tier; 
	private int recommend; 
	private int is_admin; 
	private int phone_agreement; 
	private int email_agreement;
	
}
