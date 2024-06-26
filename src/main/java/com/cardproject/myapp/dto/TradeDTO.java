package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TradeDTO {
	private int trade_id; //�ŷ���ȣ
	private String user_id; //�����ھ��̵�
	private int item_id; //��ǰ���̵�
	private int price; //�����ݾ�
	private int trade_type; //�ŷ����
	private String create_date; //��������
	private Date confirm_date; //�ŷ�Ȯ������
	private int is_recommend; //��õ����
	private int stage; //�ŷ���Ȳ
	private String image1;
	private String item_name;
}
