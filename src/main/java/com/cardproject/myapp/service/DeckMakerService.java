package com.cardproject.myapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.stereotype.Service;
import com.cardproject.myapp.dao.DeckMakerDAO;
import com.cardproject.myapp.dto.DeckDTO;
import com.cardproject.myapp.dto.DeckSourceDTO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Service
public class DeckMakerService {

	@Autowired
    private DeckMakerDAO deckMakerDAO;

    public List<PokemonDTO> getPCardList(int page, Map<String, String> filters) {
        int itemsPerPage = 30;
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = page * itemsPerPage;

        Map<String, Object> params = new HashMap<>(filters);
        params.put("startRow", startRow);
        params.put("endRow", endRow);

        System.out.println("serviceParams:" + params);
        return deckMakerDAO.selectOrFilterPCard(params);
    }
    //덱리스트 메인 정보불러오기
    //포켓몬
    public List<Map<String, Object>> getPDecks(int cat, int page, int pageSize, String query, String sort) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        System.out.println("Start=" +startRow);
        System.out.println("endRow=" +endRow);
        System.out.println("sort=" +sort);
        
            return deckMakerDAO.getPThumbnail(cat, query, startRow, endRow, sort);
    }
    //유희왕
    public List<Map<String, Object>> getYDecks(int cat, int page, int pageSize, String query, String sort) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        System.out.println("Start=" +startRow);
        System.out.println("endRow=" +endRow);
        System.out.println("sort=" +sort);
        
            return deckMakerDAO.getYThumbnail(cat, query, startRow, endRow, sort);
    }
    //디지몬
    public List<Map<String, Object>> getDDecks(int cat, int page, int pageSize, String query, String sort) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        System.out.println("Start=" +startRow);
        System.out.println("endRow=" +endRow);
        System.out.println("sort=" +sort);
        
            return deckMakerDAO.getDThumbnail(cat, query, startRow, endRow, sort);
    }
    //원피스
    public List<Map<String, Object>> getODecks(int cat, int page, int pageSize, String query, String sort) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        System.out.println("Start=" +startRow);
        System.out.println("endRow=" +endRow);
        System.out.println("sort=" +sort);
        
            return deckMakerDAO.getOThumbnail(cat, query, startRow, endRow, sort);
    }
    //공통
    public int getTotalDeckCount(int cat, String query) {
    	Map<String, Object> params = new HashMap<>();
        params.put("cat", cat);
        params.put("query", query);
            return deckMakerDAO.getTotalDeckCount(params);
    }
    
    public List<YugiohDTO> getYCardList(int page, Map<String, String> filters) {
        int itemsPerPage = 30;
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = page * itemsPerPage;

        Map<String, Object> params = new HashMap<>(filters);
        params.put("startRow", startRow);
        params.put("endRow", endRow);

        System.out.println("serviceParams:" + params);
        return deckMakerDAO.selectOrFilterYCard(params);
    }

    public List<DigimonDTO> getDCardList(int page, Map<String, String> filters) {
        int itemsPerPage = 30;
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = page * itemsPerPage;

        Map<String, Object> params = new HashMap<>(filters);
        params.put("startRow", startRow);
        params.put("endRow", endRow);

        System.out.println("serviceParams:" + params);
        return deckMakerDAO.selectOrFilterDCard(params);
    }
    public List<OnepieceDTO> getOCardList(int page, Map<String, String> filters) {
        int itemsPerPage = 30;
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = page * itemsPerPage;

        Map<String, Object> params = new HashMap<>(filters);
        params.put("startRow", startRow);
        params.put("endRow", endRow);

        System.out.println("serviceParams:" + params);
        return deckMakerDAO.selectOrFilterOCard(params);
    }

    
    public void saveDeckSource(DeckDTO deckDTO, String[] imgList, String kind) {
    	deckMakerDAO.insertDeck(deckDTO);
    	int deckId = deckMakerDAO.deckId();
    	
    	System.out.println("deckId:" + deckId);
    	for (int i=0; i<imgList.length; i++) {
            DeckSourceDTO deckSourceDTO = new DeckSourceDTO();
            if(i==0) 
            	deckSourceDTO.setIs_thumbnail(1);
            else
            	deckSourceDTO.setIs_thumbnail(0);
            switch (kind) {
                case "P":
                    deckSourceDTO.setP_card(imgList[i]);
                    break;
                case "Y":
                    deckSourceDTO.setY_card(imgList[i]);
                    break;
                case "D":
                    deckSourceDTO.setD_card(imgList[i]);
                    break;
                case "O":
                    deckSourceDTO.setO_card(imgList[i]);
                    break;
            }
            deckSourceDTO.setDeck_id(deckId);
            deckMakerDAO.insertDeckSource(deckSourceDTO);
            //deckMakerDAO.updateThumbnail(deckId, kind);
        }
    }
    //deckDetail
    public List<Map<String, Object>> getPCardsByDeckId(int deckId) {
        return deckMakerDAO.getPCardsByDeckId(deckId);
    }
    public List<Map<String, Object>> getYCardsByDeckId(int deckId) {
        return deckMakerDAO.getYCardsByDeckId(deckId);
    }
    public List<Map<String, Object>> getDCardsByDeckId(int deckId) {
        return deckMakerDAO.getDCardsByDeckId(deckId);
    }
    public List<Map<String, Object>> getOCardsByDeckId(int deckId) {
        return deckMakerDAO.getOCardsByDeckId(deckId);
    }

    public Map<String, Object> getDeckById(int deckId) {
    	System.out.println("deckid=" + deckId);
        return deckMakerDAO.getDeckById(deckId);
    }

    public boolean recommendDeck(int deckId) {
    	try {
            deckMakerDAO.recommend(deckId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public PokemonDTO getPCardDetailsById(String cardId) {
        return deckMakerDAO.getPCardDetailsById(cardId);
    }
    public YugiohDTO getYCardDetailsById(String cardId) {
        return deckMakerDAO.getYCardDetailsById(cardId);
    }
    public DigimonDTO getDCardDetailsById(String cardId) {
        return deckMakerDAO.getDCardDetailsById(cardId);
    }
    public OnepieceDTO getOCardDetailsById(String cardId) {
        return deckMakerDAO.getOCardDetailsById(cardId);
    }
    
    
    
}
