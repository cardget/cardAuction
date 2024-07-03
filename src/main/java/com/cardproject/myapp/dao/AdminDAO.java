package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.DeliveryDTO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Repository
public class AdminDAO {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.cardproject.myapp.dao";
	
	public int insertPokemonCard(PokemonDTO pokemon) {
		int result = sqlSession.insert(namespace+".insertPokemonCard", pokemon);
		return result;
	}
	public int insertDigimonCard(DigimonDTO digimon) {
		int result = sqlSession.insert(namespace+".insertDigimonCard", digimon);
		return result;
	}
	public int insertOnepieceCard(OnepieceDTO onepiece) {
		int result = sqlSession.insert(namespace+".insertOnepieceCard", onepiece);
		return result;
	}
	public int insertYugiohCard(YugiohDTO yugioh) {
		int result = sqlSession.insert(namespace+".insertYugiohCard", yugioh);
		return result;
	}
	
	// 배송 전부 조회
	public List<DeliveryDTO> selectAllDelivery() {
		return sqlSession.selectList(namespace + ".selectAllDelivery");
	}
	
	// 배송 단건 조회
	public DeliveryDTO selectDeliveryById(int deliveryId) {
		return sqlSession.selectOne(namespace + ".selectDeliveryById", deliveryId);
	}
	
	// 송장 번호 등록
	public int updateInvoice(int deliveryId, String invoiceNumber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("deliveryId", deliveryId);
		params.put("invoiceNumber", invoiceNumber);
		return sqlSession.update(namespace + ".updateInvoice", params);
	}
}
