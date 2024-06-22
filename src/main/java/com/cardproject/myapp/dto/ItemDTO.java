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
public class ItemDTO {
	
	private int item_id; //��ǰ���̵�
	private String user_id; //�Ǹ��ھ��̵�
	private String item_name; //�̸�
	private String cmt; //�ڸ�Ʈ
	private int status; //��ǰ���� 0:�ֻ� / 1: �� / 2: �� / 3: ��
	private int min_price; //������
	private String rarity; //��͵� C<R<RR<RRR<HR<UR<SAR,CSR��
	private String create_date; //������
	private String end_date; //������
	private int trade_type; //��ȣ�ŷ���� 0:������� / 1:���ŷ� / 2:�߰�
	private int cat; //ī�װ� 0:���ϸ� / 1:����� / 2:������ / 3:���ǽ� / 4:������
	private String image1; //�̹���

	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String d_card_id; //ī����̵�
	private String p_card_id;
	private String y_card_id;
	private String s_card_id;
	private String o_card_id;

}
