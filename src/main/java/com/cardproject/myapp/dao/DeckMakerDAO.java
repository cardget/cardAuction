package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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

    public List<PokemonDTO> selectAllPCard(int startRow, int endRow) {
        Map<String, Integer> params = new HashMap<>();
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        return sqlSession.selectList(namespace + ".selectAllPCard", params);
    }

    public List<YugiohDTO> selectAllYCard(int startRow, int endRow) {
        Map<String, Integer> params = new HashMap<>();
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        return sqlSession.selectList(namespace + ".selectAllYCard", params);
    }

    public List<DigimonDTO> selectAllDCard(int startRow, int endRow) {
        Map<String, Integer> params = new HashMap<>();
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        return sqlSession.selectList(namespace + ".selectAllDCard", params);
    }

    public List<OnepieceDTO> selectAllOCard(int startRow, int endRow) {
        Map<String, Integer> params = new HashMap<>();
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        return sqlSession.selectList(namespace + ".selectAllOCard", params);
    }
    
}
