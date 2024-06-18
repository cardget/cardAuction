package com.cardproject.myapp.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cardproject.myapp.dao.DeckMakerDAO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;
import com.cardproject.myapp.service.DeckMakerService;



@Controller
@RequestMapping("/deckMakers")
public class DeckMakerController {
	
	
	@GetMapping("/deckListDetail.do")
	public void auctionMain() {
		System.out.println("deckDetail page");
		
	}
	@GetMapping("/deckListMain.do")
	public void auctionDetail() {
		System.out.println("deckListMain page");
		
	}
	@Autowired
    private DeckMakerService deckMakerService;	
	
	@RequestMapping("/pokemonDeckMaker.do")
    public void pokemonDeckMaker(Model model) {
        List<PokemonDTO> pCardList = deckMakerService.selectAllPCard();
        System.out.println(pCardList.size());
        model.addAttribute("pCardList", pCardList);
    }
	
	@RequestMapping("/yugiohDeckMaker.do")
    public void yugiohDeckMaker(Model model) {
        List<YugiohDTO> yCardList = deckMakerService.selectAllYCard();
        System.out.println(yCardList.size());
        model.addAttribute("yCardList", yCardList);
    }
	
	@RequestMapping("/digimonDeckMaker.do")
    public void digimonDeckMaker(Model model) {
        List<DigimonDTO> dCardList = deckMakerService.selectAllDCard();
        System.out.println(dCardList.size());
        model.addAttribute("dCardList", dCardList);
    }
	
	@RequestMapping("/onepieceDeckMaker.do")
    public void onepieceDeckMaker(Model model) {
        List<OnepieceDTO> oCardList = deckMakerService.selectAllOCard();
        System.out.println(oCardList.size());
        model.addAttribute("oCardList", oCardList);
    }
}
