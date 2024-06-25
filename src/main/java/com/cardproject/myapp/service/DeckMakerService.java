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
    
    public List<YugiohDTO> selectAllYCard(int page) {
    	 int itemsPerPage = 30;
         int startRow = (page - 1) * itemsPerPage + 1;
         int endRow = page * itemsPerPage;
         return deckMakerDAO.selectAllYCard(startRow, endRow);
    }

    public List<DigimonDTO> selectAllDCard(int page) {
    	int itemsPerPage = 30;
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = page * itemsPerPage;
        return deckMakerDAO.selectAllDCard(startRow, endRow);
    }

    public List<OnepieceDTO> selectAllOCard(int page) {
            int itemsPerPage = 30;
            int startRow = (page - 1) * itemsPerPage + 1;
            int endRow = page * itemsPerPage;
            return deckMakerDAO.selectAllOCard(startRow, endRow);
    }
    
   // public int saveDeck(DeckDTO deckDTO) {
   //     return deckMakerDAO.insertDeck(deckDTO);
   // }

    public void saveDeckSource(DeckDTO deckDTO, String[] imgList, String kind) {
    	deckMakerDAO.insertDeck(deckDTO);
    	int deckId = deckMakerDAO.deckId();
    	
    	System.out.println("deckId:" + deckId);
    	for (String img : imgList) {
            DeckSourceDTO deckSourceDTO = new DeckSourceDTO();
            switch (kind) {
                case "P":
                    deckSourceDTO.setP_card(img);
                    break;
                case "Y":
                    deckSourceDTO.setY_card(img);
                    break;
                case "D":
                    deckSourceDTO.setD_card(img);
                    break;
                case "O":
                    deckSourceDTO.setO_card(img);
                    break;
            }
            deckSourceDTO.setDeck_id(deckId);
            deckMakerDAO.insertDeckSource(deckSourceDTO);
        }
    }
    
    public List<DigimonDTO> filterDCard(Map<String, String> params) {
    	System.out.println("serviceParams:"+params);
        return deckMakerDAO.filterDCard(params);
    }
    public List<OnepieceDTO> filterOCard(Map<String, String> params) {
    	System.out.println("serviceParams:"+params);
        return deckMakerDAO.filterOCard(params);
    }
    public List<YugiohDTO> filterYCard(Map<String, String> params) {
    	System.out.println("serviceParams:"+params);
        return deckMakerDAO.filterYCard(params);
    }
    
}
