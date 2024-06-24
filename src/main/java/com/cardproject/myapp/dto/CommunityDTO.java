package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class CommunityDTO {
	private int comm_id; //���̵�
	private String title; //����
	private int cat;
	private String tag; //�±�
	private String ctt; //����
	private Date create_date; //�ۼ���
	private String user_id; //ȸ�����̵�
	private int recommend; //��õ��
	private int views; //��ȸ��
	private String image; // �̹���
}
