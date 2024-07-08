package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.PaymentDTO;
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
	
	// 결제 내용 추가
	public int insertPayment(PaymentDTO payment) {
		return sqlSession.insert(namespace + ".insertPayment", payment);
	}
	
	// 포인트 사용
	public int usingPoint(int amount, String userid, String cmt) {
		Map<String, Object> params = new HashMap<>();
		params.put("amount", amount);
		params.put("userid", userid);
		params.put("cmt", cmt);
		return sqlSession.update(namespace + ".usingPoint", params);
	}
	
	// 결제 여부 갱신
	public int updatePaid(int tradeId) {
		return sqlSession.update(namespace + ".updatePaid", tradeId);
	}
	
	// 배송 목록 추가
	public int insertDelivery(int tradeId, String address) {
		Map<String, Object> params = new HashMap<>();
		params.put("tradeId", tradeId);
		params.put("address", address);
		return sqlSession.insert(namespace + ".insertDelivery", params);
	}
	
	// 포인트 추가
	public int getPoint(int amount, String cmt, String userid, int cat) {
		Map<String, Object> params = new HashMap<>();
		params.put("amount", amount);
		params.put("cmt", cmt);
		params.put("userid", userid);
		params.put("cat", cat);
		return sqlSession.insert(namespace + ".getPoint", params);
	}
	
	// 판매자 조회
	public String selectSeller(int tradeId) {
		return sqlSession.selectOne(namespace + ".selectSeller", tradeId);
	}
}
