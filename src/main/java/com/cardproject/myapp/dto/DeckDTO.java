package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class DeckDTO {
	private int deck_id; //�����̵�
	private int cat; //ī�װ�
	private String deck_title; //�̸�
	private Date create_date; //��������
	private String user_id; //�ۼ���
	private int recommend; //��õ��
	private String cmt; //�ڸ�Ʈ
}
