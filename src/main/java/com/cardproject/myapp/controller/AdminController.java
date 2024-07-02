package com.cardproject.myapp.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.UserDTO;
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
	public void adminMain() {
		System.out.println("adminMain page");
	}
	@GetMapping("/insertCard.do")
	public void insertCard() {
		System.out.println("insertCard page");
	}
	@PostMapping("/insertPokemonCard.do")
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
				return "redirect:insertCard.do";
			}			
		}
		else {
			pokemon.setCard_image(null);
		}	
		
		admService.insertPokemonCard(pokemon);		
		System.out.println(pokemon.getCard_image());
		return "redirect:insertCard.do";
	}
	@PostMapping("/insertDigimonCard.do")
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
				return "redirect:insertCard.do";
			}			
		}
		else {
			digimon.setCard_image(null);
		}	
		
		admService.insertDigimonCard(digimon);		
		System.out.println(digimon.getCard_image());		
		
		
		return "redirect:insertCard.do";
	}
	@PostMapping("/insertOnepieceCard.do")
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
				return "redirect:insertCard.do";
			}			
		}
		else {
			onepiece.setCard_image(null);
		}	
		
		admService.insertOnepieceCard(onepiece);		
		System.out.println(onepiece.getCard_image());
		
		return "redirect:insertCard.do";
	}
	@PostMapping("/insertYugiohCard.do")
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
				return "redirect:insertCard.do";
			}			
		}
		else {
			yugioh.setCard_image(null);
		}	
		
		admService.insertYugiohCard(yugioh);		
		System.out.println(yugioh.getCard_image());
		
		return "redirect:insertCard.do";
	}
}
