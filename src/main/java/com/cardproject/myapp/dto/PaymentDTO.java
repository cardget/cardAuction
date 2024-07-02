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
public class PaymentDTO {
	private String imp_uid;
	private int trade_id;
	private String apply_num;
	private String bank_name;
	private String card_name;
	private String card_number;
	private int paid_amount;
	private String paid_at;
	private String pay_method;
	private String pg_provider;
	private String pg_tid;
	private String pg_type;
	private String receipt_url;
	private String status;
	private int point_used;
	private String item_name;
	private String buyer_addr;
}
