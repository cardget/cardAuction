package com.cardproject.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.AdminDAO;
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
	
}
