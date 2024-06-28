package com.cardproject.myapp.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.TradeDTO;


@Repository
public class PaymentDAO{

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao";

	// 거래 조회
	public TradeDTO selectTradeById(int tradeId) {
        return sqlSession.selectOne(namespace + ".selectTradeById", tradeId);
    }
}
