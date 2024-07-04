package com.cardproject.myapp.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cardproject.myapp.dto.AdminInfoDTO;
import com.cardproject.myapp.dto.DeliveryDTO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.YugiohDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {	
	
	@Autowired
	private AWSS3Service s3Service;
	
	@Autowired
	AdminService admService;
	
	@GetMapping("/adminMain.do")
	public void adminMain(Model model) {
		AdminInfoDTO info = new AdminInfoDTO();
		
		info.setUserCnt(admService.countAllUser());
		info.setSignupCnt(admService.countSigningUpByMonth());
		info.setDisableCnt(admService.countDisabledByMonth());
		info.setItemCnt(admService.countAllItems());
		info.setRegisterCnt(admService.countItemsByMonth());
		info.setWinningCnt(admService.countWinningByMonth());
		info.setTurnover(admService.sumAllTurnoverByMonth());
		
		model.addAttribute("info", info);
	}
	
	@GetMapping("/insertPCard.do")
	public void insertPCard() {
	}
	
	@GetMapping("/insertYCard.do")
	public void insertYCard() {
	}
	
	@GetMapping("/insertDCard.do")
	public void insertDCard() {
	}
	
	@GetMapping("/insertOCard.do")
	public void insertOCard() {
	}
	
	@PostMapping("/insertPCard.do")
	public String pokemonUpload(@RequestParam(value= "pokemon_card_image") MultipartFile file, Model model, PokemonDTO pokemon) {
		
		if(file!=null && !file.isEmpty()) {
			String fileName = "images/"+ file.getOriginalFilename();
			try {
				String url = s3Service.uploadObject(file, fileName);
				pokemon.setCard_image(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				model.addAttribute("error","이미지 업로드 중 오류가 발생했습니다.");
				return "redirect:insertPCard.do";
			}			
		}
		else {
			pokemon.setCard_image(null);
		}	
		
		admService.insertPokemonCard(pokemon);		
		System.out.println(pokemon.getCard_image());
		return "redirect:insertPCard.do";
	}
	
	@PostMapping("/insertDCard.do")
	public String digimonUpload(@RequestParam(value= "digimon_card_image", required=false) MultipartFile file, Model model, DigimonDTO digimon) {
		
		if(file!=null && !file.isEmpty()) {
			String fileName = "images/"+ file.getOriginalFilename();
			try {
				String url = s3Service.uploadObject(file, fileName);
				digimon.setCard_image(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				model.addAttribute("error","이미지 업로드 중 오류가 발생했습니다.");
				return "redirect:insertDCard.do";
			}			
		}
		else {
			digimon.setCard_image(null);
		}	
		
		admService.insertDigimonCard(digimon);		
		System.out.println(digimon.getCard_image());		
		
		
		return "redirect:insertDCard.do";
	}
	
	@PostMapping("/insertOCard.do")
	public String onepieceUpload(@RequestParam(value= "onepiece_card_image") MultipartFile file, Model model, OnepieceDTO onepiece) {
		
		if(file!=null && !file.isEmpty()) {
			String fileName = "images/"+ file.getOriginalFilename();
			try {
				String url = s3Service.uploadObject(file, fileName);
				onepiece.setCard_image(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				model.addAttribute("error","이미지 업로드 중 오류가 발생했습니다.");
				return "redirect:insertOCard.do";
			}			
		}
		else {
			onepiece.setCard_image(null);
		}	
		
		admService.insertOnepieceCard(onepiece);		
		System.out.println(onepiece.getCard_image());
		
		return "redirect:insertOCard.do";
	}
	
	@PostMapping("/insertYCard.do")
	public String yugiohUpload(@RequestParam(value= "yugioh_card_image") MultipartFile file, Model model, YugiohDTO yugioh) {
		
		if(file!=null && !file.isEmpty()) {
			String fileName = "images/"+ file.getOriginalFilename();
			try {
				String url = s3Service.uploadObject(file, fileName);
				yugioh.setCard_image(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				model.addAttribute("error","이미지 업로드 중 오류가 발생했습니다.");
				return "redirect:insertYCard.do";
			}			
		}
		else {
			yugioh.setCard_image(null);
		}	
		
		admService.insertYugiohCard(yugioh);		
		System.out.println(yugioh.getCard_image());
		
		return "redirect:insertYCard.do";
	}
	
	@GetMapping("/manageDelivery.do")
	public String displayDelivery(Model model) {
		
		List<DeliveryDTO> dlist = admService.selectAllDelivery();
		
		model.addAttribute("dlist", dlist);
		return "admin/manageDelivery";
	}
	
	@GetMapping("/updateInvoice.do")
	public String displayInvoice(@RequestParam("deliveryId") int deliveryId, Model model) {
		
		DeliveryDTO delivery = admService.selectDeliveryById(deliveryId);
		
		model.addAttribute("delivery", delivery);
		return "admin/updateInvoice";
	}
	
	@PostMapping("/updateInvoice.do")
	public String updateInvoiceNumber(
			@RequestParam("deliveryId") int deliveryId,
			@RequestParam("invoiceNumber") String invoiceNumber,
			Model model) {
		int result = admService.updateInvoice(deliveryId, invoiceNumber);
		String message = result > 0 ? "성공" : "실패";
		
		model.addAttribute("message", message);
		
		return "redirect:manageDelivery.do";
	}
	
	@PostMapping("/searchDelivery.do")
	public void searchDelivery(
			@RequestParam("buyer") String userid,
			@RequestParam("noInvoice") String noInvoiceS,
			Model model) {
		int noInvoice = noInvoiceS.equals("true")?1:0;
		
		List<DeliveryDTO> dlist = admService.selectDeliveryByUser(userid, noInvoice);
		
		model.addAttribute("dlist", dlist);
	}
}
