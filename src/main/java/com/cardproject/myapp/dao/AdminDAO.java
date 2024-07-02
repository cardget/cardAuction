package com.cardproject.myapp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
