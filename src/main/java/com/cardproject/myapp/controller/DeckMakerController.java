package com.cardproject.myapp.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cardproject.myapp.dao.DeckMakerDAO;
import com.cardproject.myapp.dto.DeckDTO;
import com.cardproject.myapp.dto.DeckSourceDTO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.NotificationDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.dto.YugiohDTO;
import com.cardproject.myapp.service.DeckMakerService;
import com.cardproject.myapp.service.MyPageService;

import kotlin.internal.RequireKotlin;

@Controller
@RequestMapping("/deckMakers")
public class DeckMakerController {

	@GetMapping("/pokemonDeckListMain.do")
	public String getPDecks(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "9") int pageSize,
			@RequestParam(value = "sort", required = false, defaultValue = "create_date") String sort,
			@RequestParam(required = false) String query) {

		int cat = 1; // 이부분 바뀜
		int totalDecks = deckMakerService.getTotalDeckCount(cat, query); // 공통
		int totalPages = (int) Math.ceil((double) totalDecks / pageSize);// 공통

		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);

		List<Map<String, Object>> decks = deckMakerService.getPDecks(cat, page, pageSize, query, sort);

		model.addAttribute("decks", decks);
		model.addAttribute("query", query);
		model.addAttribute("sort", sort);

		return "deckMakers/pokemonDeckListMain";
	}

	@GetMapping("/yugiohDeckListMain.do")
	public String getYDecks(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "9") int pageSize,
			@RequestParam(value = "sort", required = false, defaultValue = "create_date") String sort,
			@RequestParam(required = false) String query) {

		int cat = 2; // 이부분 바뀜
		int totalDecks = deckMakerService.getTotalDeckCount(cat, query); // 공통
		int totalPages = (int) Math.ceil((double) totalDecks / pageSize);// 공통

		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);

		List<Map<String, Object>> decks = deckMakerService.getYDecks(cat, page, pageSize, query, sort);

		model.addAttribute("decks", decks);
		model.addAttribute("query", query);
		model.addAttribute("sort", sort);

		return "deckMakers/yugiohDeckListMain";
	}

	@GetMapping("/digimonDeckListMain.do")
	public String getDDecks(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "9") int pageSize,
			@RequestParam(value = "sort", required = false, defaultValue = "create_date") String sort,
			@RequestParam(required = false) String query) {

		int cat = 3; // 이부분 바뀜
		int totalDecks = deckMakerService.getTotalDeckCount(cat, query); // 공통
		int totalPages = (int) Math.ceil((double) totalDecks / pageSize);// 공통

		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);

		List<Map<String, Object>> decks = deckMakerService.getDDecks(cat, page, pageSize, query, sort);

		model.addAttribute("decks", decks);
		model.addAttribute("query", query);
		model.addAttribute("sort", sort);

		return "deckMakers/digimonDeckListMain";
	}

	@GetMapping("/onepieceDeckListMain.do")
	public String getODecks(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "9") int pageSize,
			@RequestParam(value = "sort", required = false, defaultValue = "create_date") String sort,
			@RequestParam(required = false) String query) {

		int cat = 4; // 이부분 바뀜
		int totalDecks = deckMakerService.getTotalDeckCount(cat, query); // 공통
		int totalPages = (int) Math.ceil((double) totalDecks / pageSize);// 공통

		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);

		List<Map<String, Object>> decks = deckMakerService.getODecks(cat, page, pageSize, query, sort);

		model.addAttribute("decks", decks);
		model.addAttribute("query", query);
		model.addAttribute("sort", sort);

		return "deckMakers/onepieceDeckListMain";
	}

	@Autowired
	private DeckMakerService deckMakerService;
	@Autowired
	HttpSession session;
	@Autowired
	MyPageService mpService;

	// 포켓몬카드 -------------------------------------------------------------------
	@RequestMapping("/pokemonDeckMaker.do")
	public void pokemonDeckMaker(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_type", required = false, defaultValue = "t") String cardType,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {
		Map<String, String> params = new HashMap<>();

		String userid = (String) session.getAttribute("userid");
		params.put("card_type", cardType);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<PokemonDTO> pCardList = deckMakerService.getPCardList(page, params);
		System.out.println(pCardList.size());
		model.addAttribute("pCardList", pCardList);
		model.addAttribute("currentPage", page);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}

	}

	@GetMapping(value = "/loadMorePCard.do", produces = "application/json")
	public @ResponseBody List<PokemonDTO> loadMorePCard(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_type", required = false, defaultValue = "t") String cardType,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {// 추가한부분
		Map<String, String> params = new HashMap<>();

		params.put("card_type", cardType);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<PokemonDTO> pCardList = deckMakerService.getPCardList(page, params);
		System.out.println(pCardList.size());
		return pCardList;
	}

	// 유희왕카드 -------------------------------------------------------------------
	@RequestMapping("/yugiohDeckMaker.do")
	public void yugiohDeckMaker(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_attr", required = false, defaultValue = "a") String cardAttr,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {
		Map<String, String> params = new HashMap<>();

		String userid = (String) session.getAttribute("userid");
		params.put("card_attr", cardAttr);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<YugiohDTO> yCardList = deckMakerService.getYCardList(page, params);
		System.out.println(yCardList.size());
		model.addAttribute("yCardList", yCardList);
		model.addAttribute("currentPage", page);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
	}

	@GetMapping(value = "/loadMoreYCard.do", produces = "application/json")
	public @ResponseBody List<YugiohDTO> loadMoreYCard(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_attr", required = false, defaultValue = "a") String cardAttr,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {
		Map<String, String> params = new HashMap<>();

		params.put("card_attr", cardAttr);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<YugiohDTO> yCardList = deckMakerService.getYCardList(page, params);
		System.out.println(yCardList.size());
		return yCardList;
	}

	// 디지몬카드 -------------------------------------------------------------------
	@RequestMapping("/digimonDeckMaker.do")
	public void digimonDeckMaker(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_attr", required = false, defaultValue = "a") String cardAttr,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {
		Map<String, String> params = new HashMap<>();

		String userid = (String) session.getAttribute("userid");
		params.put("card_attr", cardAttr);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<DigimonDTO> dCardList = deckMakerService.getDCardList(page, params);
		System.out.println(dCardList.size());
		model.addAttribute("dCardList", dCardList);
		model.addAttribute("currentPage", page);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
	}

	@GetMapping(value = "/loadMoreDCard.do", produces = "application/json")
	public @ResponseBody List<DigimonDTO> loadMoreDCard(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_attr", required = false, defaultValue = "a") String cardAttr,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {
		Map<String, String> params = new HashMap<>();

		params.put("card_attr", cardAttr);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<DigimonDTO> dCardList = deckMakerService.getDCardList(page, params);
		System.out.println(dCardList.size());
		return dCardList;
	}

	// 원피스카드 -------------------------------------------------------------------
	@RequestMapping("/onepieceDeckMaker.do")
	public void onepieceDeckMaker(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_attr", required = false, defaultValue = "a") String cardAttr,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {
		Map<String, String> params = new HashMap<>();

		String userid = (String) session.getAttribute("userid");
		params.put("card_attr", cardAttr);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<OnepieceDTO> oCardList = deckMakerService.getOCardList(page, params);
		System.out.println(oCardList.size());
		model.addAttribute("oCardList", oCardList);
		model.addAttribute("currentPage", page);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
	}

	@GetMapping(value = "/loadMoreOCard.do", produces = "application/json")
	public @ResponseBody List<OnepieceDTO> loadMoreOCard(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value = "card_attr", required = false, defaultValue = "a") String cardAttr,
			@RequestParam(value = "card_sort", required = false, defaultValue = "s") String cardSort,
			@RequestParam(value = "query", required = false, defaultValue = "") String cardName) {
		Map<String, String> params = new HashMap<>();

		params.put("card_attr", cardAttr);
		params.put("card_sort", cardSort);
		params.put("card_name", cardName.isEmpty() ? null : cardName);
		List<OnepieceDTO> oCardList = deckMakerService.getOCardList(page, params);
		System.out.println(oCardList.size());
		return oCardList;
	}

	// insert
	@PostMapping("/insertDeck.do")
	public String addDeck(@RequestParam String kind, @RequestParam String deckTitle, @RequestParam String commentBox,
			@RequestParam("imgList[]") String[] imgList, HttpSession session, Model model) {

		String userId = (String) session.getAttribute("userid");

		if (userId == null) {
			throw new RuntimeException("로그인 후 이용해주십시오.");
		}

		System.out.println(userId);
		DeckDTO deckDTO = new DeckDTO();
		deckDTO.setDeck_title(deckTitle);
		deckDTO.setCmt(commentBox);
		deckDTO.setUser_id(userId);
		deckDTO.setRecommend(0);

		String redirectUrl = "redirect:";

		switch (kind) {
		case "P":
			deckDTO.setCat(1);
			redirectUrl += "pokemonDeckListMain.do";
			break;
		case "Y":
			deckDTO.setCat(2);
			redirectUrl += "yugiohDeckListMain.do";
			break;
		case "D":
			deckDTO.setCat(3);
			redirectUrl += "digimonDeckListMain.do";
			break;
		case "O":
			deckDTO.setCat(4);
			redirectUrl += "onepieceDeckListMain.do";
			break;
		default:
			throw new IllegalArgumentException("Invalid kind: " + kind);
		}

		deckMakerService.saveDeckSource(deckDTO, imgList, kind);
		return redirectUrl;
	}

	// deckDetail
	// 포켓몬 덱정보
	@GetMapping("/pokemonDeckListDetail")
	public String getPDeckDetail(@RequestParam("deck_id") int deckId, Model model) {
		List<Map<String, Object>> cards = deckMakerService.getPCardsByDeckId(deckId);
		Map<String, Object> deck = deckMakerService.getDeckById(deckId);
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("cards", cards);
		model.addAttribute("deck", deck);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
		return "deckMakers/pokemonDeckListDetail";
	}

	// 유희왕
	@GetMapping("/yugiohDeckListDetail")
	public String getYDeckDetail(@RequestParam("deck_id") int deckId, Model model) {
		List<Map<String, Object>> cards = deckMakerService.getYCardsByDeckId(deckId);
		Map<String, Object> deck = deckMakerService.getDeckById(deckId);
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("cards", cards);
		model.addAttribute("deck", deck);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
		return "deckMakers/yugiohDeckListDetail";
	}

	// 디지몬
	@GetMapping("/digimonDeckListDetail")
	public String getDDeckDetail(@RequestParam("deck_id") int deckId, Model model) {
		List<Map<String, Object>> cards = deckMakerService.getDCardsByDeckId(deckId);
		Map<String, Object> deck = deckMakerService.getDeckById(deckId);
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("cards", cards);
		model.addAttribute("deck", deck);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
		return "deckMakers/digimonDeckListDetail";
	}

	// 원피스
	@GetMapping("/onepieceDeckListDetail")
	public String getODeckDetail(@RequestParam("deck_id") int deckId, Model model) {
		List<Map<String, Object>> cards = deckMakerService.getOCardsByDeckId(deckId);
		Map<String, Object> deck = deckMakerService.getDeckById(deckId);
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("cards", cards);
		model.addAttribute("deck", deck);
		if (userid != null) {

			UserDTO user = mpService.selectUserById(userid);
			List<NotificationDTO> nlist = mpService.selectFiveNotifications(userid);
			model.addAttribute("user", user);
			model.addAttribute("nlist", nlist);
		}
		return "deckMakers/onepieceDeckListDetail";
	}

	// 추천(공통)
	@PostMapping(value = "/recommendDeck.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> recommendDeck(@RequestBody Map<String, Integer> requestData) {
		
		Map<String, Object> response = new HashMap<>();
		
		String userid = (String) session.getAttribute("userid");
	    if (userid == null) {
	        response.put("success", false);
	        response.put("message", "로그인 후 이용해주세요.");
	        return response;
	    }

	    int deckId = requestData.get("deck_id");
	    System.out.println("Received deck_id for recommendation: " + deckId);
	    boolean success = deckMakerService.recommendDeck(deckId);
	    response.put("success", success);
	    if (!success) {
	        response.put("message", "추천 처리 중 오류가 발생했습니다.");
	    }
	    return response;
	}

	// 삭제(공통)
	@PostMapping(value = "/deleteDeck.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> deleteDeck(@RequestBody Map<String, Integer> requestData) {
		int deckId = requestData.get("deck_id");
		System.out.println("삭제할 deck_id: " + deckId);
		boolean sSuccess = deckMakerService.deleteSource(deckId);
		boolean dSuccess = deckMakerService.deleteDeck(deckId);
		Map<String, Object> response = new HashMap<>();
		response.put("sourceSuccess", sSuccess);
		response.put("dSuccess", dSuccess);
		return response;
	}

	// 카드변경 포켓몬
	@GetMapping("/getPCardDetails.do")
	@ResponseBody
	public PokemonDTO getPCardDetails(@RequestParam("card_id") String cardId) {
		return deckMakerService.getPCardDetailsById(cardId);
	}

	// 유희왕
	@GetMapping("/getYCardDetails.do")
	@ResponseBody
	public YugiohDTO getYCardDetails(@RequestParam("card_id") String cardId) {
		return deckMakerService.getYCardDetailsById(cardId);
	}

	// 디지몬
	@GetMapping("/getDCardDetails.do")
	@ResponseBody
	public DigimonDTO getDCardDetails(@RequestParam("card_id") String cardId) {
		return deckMakerService.getDCardDetailsById(cardId);
	}

	// 원피스
	@GetMapping("/getOCardDetails.do")
	@ResponseBody
	public OnepieceDTO getOCardDetails(@RequestParam("card_id") String cardId) {
		return deckMakerService.getOCardDetailsById(cardId);
	}

}
