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
	
	// 회원 수 조회
	public int countAllUser() {
		return sqlSession.selectOne(namespace + ".countAllUser");
	}
	
	// 이번 달 가입자
	public int countSigningUpByMonth() {
		return sqlSession.selectOne(namespace + ".countSigningUpByMonth");
	}
	
	// 이번 달 탈퇴자
	public int countDisabledByMonth() {
		return sqlSession.selectOne(namespace + ".countDisabledByMonth");
	}
	
	// 전체 물품
	public int countAllItems() {
		return sqlSession.selectOne(namespace + ".countAllItems");
	}
	
	// 이번 달 물품 등록 추이
	public int countItemsByMonth() {
		return sqlSession.selectOne(namespace + ".countItemsByMonth");
	}
	
	// 이번 달 물품 낙찰 추이
	public int countWinningByMonth() {
		return sqlSession.selectOne(namespace + ".countWinningByMonth");
	}
	
	// 당월 거래액
	public int sumAllTurnoverByMonth() {
		return sqlSession.selectOne(namespace + ".sumAllTurnoverByMonth");
	}
	
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
	
	// 배송 조회
	public List<DeliveryDTO> selectDeliveryByUser(String userid, int noInvoice){
		Map<String, Object> params = new HashMap<>();
		params.put("userid", userid);
		params.put("noInvoice", noInvoice);
		return sqlSession.selectList(namespace + ".selectDeliveryByUser", params);
	}
	
	// 송장 번호 등록
	public int updateInvoice(int deliveryId, String invoiceNumber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("deliveryId", deliveryId);
		params.put("invoiceNumber", invoiceNumber);
		return sqlSession.update(namespace + ".updateInvoice", params);
	}
	
}
