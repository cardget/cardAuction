package com.cardproject.myapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.PaymentDAO;
import com.cardproject.myapp.dto.TradeDTO;


@Service
public class PaymentService {

    @Autowired
    private PaymentDAO paymentDAO;

    // 거래 조회
 	public TradeDTO selectTradeById(int tradeId) {
         return paymentDAO.selectTradeById(tradeId);
     }
}
