package com.cardproject.myapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cardproject.myapp.dao.DeckMakerDAO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Service
public class DeckMakerService {

    @Autowired
    private DeckMakerDAO deckMakerDAO;

    public List<PokemonDTO> selectAllPCard(int page) {
    	int itemsPerPage = 1;
        int startRow = (page - 1) * itemsPerPage + 1;
        int endRow = page * itemsPerPage;
        return deckMakerDAO.selectAllPCard(startRow, endRow);
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
    
}
