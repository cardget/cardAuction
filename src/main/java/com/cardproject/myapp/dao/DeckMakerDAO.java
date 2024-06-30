package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.DeckDTO;
import com.cardproject.myapp.dto.DeckSourceDTO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Repository
public class DeckMakerDAO {
    
    @Autowired
    private SqlSession sqlSession;
    String namespace = "com.cardproject.myapp.dao";

    public List<PokemonDTO> selectOrFilterPCard(Map<String, Object> params) {
        System.out.println("DAOparams:" + params);
        return sqlSession.selectList(namespace + ".selectOrFilterPCard", params);
    }
    //덱리스트메인 불러오기
    public List<Map<String, Object>> getThumbnail(int cat, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("cat", cat);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return sqlSession.selectList(namespace + ".getThumbnail", params);
    }

    public List<Map<String, Object>> getThumbnailWithQuery(int cat, String query, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("cat", cat);
        params.put("query", query);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return sqlSession.selectList(namespace + ".getThumbnailWithQuery", params);
    }

    public int getTotalDeckCount() {
        return sqlSession.selectOne(namespace + ".getTotalDeckCount");
    }

    public int getTotalDeckCountByQuery(String query) {
        Map<String, Object> params = new HashMap<>();
        params.put("query", query);
        return sqlSession.selectOne(namespace + ".getTotalDeckCountByQuery", params);
    }

    public List<YugiohDTO> selectOrFilterYCard(Map<String, Object> params) {
        System.out.println("DAOparams:" + params);
        return sqlSession.selectList(namespace + ".selectOrFilterYCard", params);
    }

    public List<DigimonDTO> selectOrFilterDCard(Map<String, Object> params) {
        System.out.println("DAOparams:" + params);
        return sqlSession.selectList(namespace + ".selectOrFilterDCard", params);
    }
    
    public List<OnepieceDTO> selectOrFilterOCard(Map<String, Object> params) {
        System.out.println("DAOparams:" + params);
        return sqlSession.selectList(namespace + ".selectOrFilterOCard", params);
    }
    
    //덱정보 추가
    public int insertDeck(DeckDTO deckDTO) {
        sqlSession.insert(namespace + ".insertDeck", deckDTO);
        return deckDTO.getDeck_id();
    }

    public void insertDeckSource(DeckSourceDTO deckSourceDTO) {
        sqlSession.insert(namespace + ".insertDeckSource", deckSourceDTO);
    }
    
    public int deckId() {
        return sqlSession.selectOne(namespace + ".deckId");
    }
    public void updateThumbnail(int deckId, String kind) {
        Map<String, Object> params = new HashMap<>();
        params.put("deckId", deckId);
        params.put("kind", kind);
        sqlSession.update(namespace + ".updateThumbnail", params);
    }

    
}