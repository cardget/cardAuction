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
		
	// 송장 번호 등록
	public int updateInvoice(int deliveryId, String invoiceNumber) {
		return adminDAO.updateInvoice(deliveryId, invoiceNumber);
	}

}
