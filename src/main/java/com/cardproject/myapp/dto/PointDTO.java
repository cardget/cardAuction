package com.cardproject.myapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class PointDTO {
	private int point_id; //����Ʈ���̵�
	private int amount; //��
	private Date create_date; //������
	private String cmt; //�ڸ�Ʈ
	private String user_id; //���̵�
	private int is_add; //����,��뿩��
	private int cat;
}
