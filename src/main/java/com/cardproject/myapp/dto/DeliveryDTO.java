package com.cardproject.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class DeliveryDTO {
	private String delivery_id;
	private int trade_id;
	private int item_id;
	private String create_date;
	private String user_id;
	private String image1;
	private String item_name;
}
