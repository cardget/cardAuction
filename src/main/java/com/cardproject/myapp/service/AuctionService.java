package com.cardproject.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.AuctionDAO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.PokemonDTO;

@Service
public class AuctionService {
	
	@Autowired
	AuctionDAO aucDAO;
	
	public void test() {
		aucDAO.test();
	}
	public int itemInsert(ItemDTO item) {
		return aucDAO.itemInsert(item);
	}
	public List<PokemonDTO> selectPCardName() {
		return aucDAO.selectPCardName();
	}
	
}
