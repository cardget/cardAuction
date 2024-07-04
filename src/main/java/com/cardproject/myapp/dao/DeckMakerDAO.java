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

    
    //덱리스트메인 불러오기
    public List<Map<String, Object>> getPThumbnail(int cat, String query, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("cat", cat);
        params.put("query", query);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return sqlSession.selectList(namespace + ".getPThumbnail", params);
    }
    public List<Map<String, Object>> getYThumbnail(int cat, String query, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("cat", cat);
        params.put("query", query);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return sqlSession.selectList(namespace + ".getYThumbnail", params);
    }
    public List<Map<String, Object>> getDThumbnail(int cat, String query, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("cat", cat);
        params.put("query", query);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return sqlSession.selectList(namespace + ".getDThumbnail", params);
    }
    public List<Map<String, Object>> getOThumbnail(int cat, String query, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("cat", cat);
        params.put("query", query);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return sqlSession.selectList(namespace + ".getOThumbnail", params);
    }
    //공통 덱카운트
    public int getTotalDeckCount(Map<String, Object> params) {
        return sqlSession.selectOne(namespace + ".getTotalDeckCount", params);
    }
    
    public List<PokemonDTO> selectOrFilterPCard(Map<String, Object> params) {
        System.out.println("DAOparams:" + params);
        return sqlSession.selectList(namespace + ".selectOrFilterPCard", params);
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
    
    //deckDetail
    public List<Map<String, Object>> getPCardsByDeckId(int deckId) {
        return sqlSession.selectList(namespace + ".getPCardsByDeckId", deckId);
    }
    public List<Map<String, Object>> getYCardsByDeckId(int deckId) {
        return sqlSession.selectList(namespace + ".getYCardsByDeckId", deckId);
    }
    public List<Map<String, Object>> getDCardsByDeckId(int deckId) {
        return sqlSession.selectList(namespace + ".getDCardsByDeckId", deckId);
    }
    public List<Map<String, Object>> getOCardsByDeckId(int deckId) {
        return sqlSession.selectList(namespace + ".getOCardsByDeckId", deckId);
    }

    public Map<String, Object> getDeckById(int deckId) {
        return sqlSession.selectOne(namespace + ".getDeckById", deckId);
    }

    public int recommend(int deckId) {
        return sqlSession.update(namespace + ".recommend", deckId);
    }
    
    public int deleteSource(int deckId) {
        return sqlSession.delete(namespace + ".deleteSource", deckId);
    }
    public int deleteDeck(int deckId) {
        return sqlSession.delete(namespace + ".deleteDeck", deckId);
    }
    
    public PokemonDTO getPCardDetailsById(String cardId) {
        return sqlSession.selectOne(namespace + ".getPCardDetailsById", cardId);
    }
    public YugiohDTO getYCardDetailsById(String cardId) {
        return sqlSession.selectOne(namespace + ".getYCardDetailsById", cardId);
    }
    public DigimonDTO getDCardDetailsById(String cardId) {
        return sqlSession.selectOne(namespace + ".getDCardDetailsById", cardId);
    }
    public OnepieceDTO getOCardDetailsById(String cardId) {
        return sqlSession.selectOne(namespace + ".getOCardDetailsById", cardId);
    }

    
}