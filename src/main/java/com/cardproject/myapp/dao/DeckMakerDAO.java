package com.cardproject.myapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Repository
public class DeckMakerDAO {
    
    @Autowired
    private SqlSession sqlSession;
    String namespace = "com.cardproject.myapp.dao";

    public List<PokemonDTO> selectAllPCard() {
        return sqlSession.selectList(namespace + ".selectAllPCard");
    }
    
    public List<YugiohDTO> selectAllYCard() {
        return sqlSession.selectList(namespace + ".selectAllYCard");
    }

    public List<DigimonDTO> selectAllDCard() {
        return sqlSession.selectList(namespace + ".selectAllDCard");
    }

    public List<OnepieceDTO> selectAllOCard() {
        return sqlSession.selectList(namespace + ".selectAllOCard");
    }
}
