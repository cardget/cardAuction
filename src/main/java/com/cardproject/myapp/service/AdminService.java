package com.cardproject.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.AdminDAO;
import com.cardproject.myapp.dto.DeliveryDTO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	// 회원 수 조회
	public int countAllUser() {
		return adminDAO.countAllUser();
	}
		
	// 이번 달 가입자
	public int countSigningUpByMonth() {
		return adminDAO.countSigningUpByMonth();
	}
		
	// 이번 달 탈퇴자
	public int countDisabledByMonth() {
		return adminDAO.countDisabledByMonth();
	}
	
	// 전체 물품
	public int countAllItems() {
		return adminDAO.countAllItems();
	}
	
	// 이번 달 물품 등록 추이
	public int countItemsByMonth() {
		return adminDAO.countItemsByMonth();
	}
		
	// 이번 달 물품 낙찰 추이
	public int countWinningByMonth() {
		return adminDAO.countWinningByMonth();
	}	
	
	// 당월 거래액
	public int sumAllTurnoverByMonth() {
		return adminDAO.sumAllTurnoverByMonth();
	}
	
	public int insertPokemonCard(PokemonDTO pokemon) {
		return adminDAO.insertPokemonCard(pokemon);
	}
	
	public int insertDigimonCard(DigimonDTO digimon) {
		return adminDAO.insertDigimonCard(digimon);
	}
	
	public int insertOnepieceCard(OnepieceDTO onepiece) {
		return adminDAO.insertOnepieceCard(onepiece);
	}
	
	public int insertYugiohCard(YugiohDTO yugioh) {
		return adminDAO.insertYugiohCard(yugioh);
	}
	
	// 배송 전부 조회
	public List<DeliveryDTO> selectAllDelivery() {
		return adminDAO.selectAllDelivery();
	}
	
	// 배송 단건 조회
	public DeliveryDTO selectDeliveryById(int deliveryId) {
		return adminDAO.selectDeliveryById(deliveryId);
	}
		
	// 배송 조회
	public List<DeliveryDTO> selectDeliveryByUser(String userid, int noInvoice){
		return adminDAO.selectDeliveryByUser(userid, noInvoice);
	}
	
	// 송장 번호 등록
	public int updateInvoice(int deliveryId, String invoiceNumber) {
		return adminDAO.updateInvoice(deliveryId, invoiceNumber);
	}

}
