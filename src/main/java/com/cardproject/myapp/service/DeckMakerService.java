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

    public List<PokemonDTO> selectAllPCard() {
        return deckMakerDAO.selectAllPCard();
    }
    
    public List<YugiohDTO> selectAllYCard() {
        return deckMakerDAO.selectAllYCard();
    }

    public List<DigimonDTO> selectAllDCard() {
        return deckMakerDAO.selectAllDCard();
    }

    public List<OnepieceDTO> selectAllOCard() {
        return deckMakerDAO.selectAllOCard();
    }
}
