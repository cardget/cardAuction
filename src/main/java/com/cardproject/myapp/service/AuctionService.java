package com.cardproject.myapp.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.AuctionDAO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.dto.LikeDTO;
import com.cardproject.myapp.dto.PokemonDTO;

@Service
public class AuctionService {
	
	@Autowired
	AuctionDAO aucDAO;
	
	public ItemDetailDTO selectItemOne(int item_id) {
		return aucDAO.selectItemOne(item_id);
	}
	public List<ItemDetailDTO> selectItemRecent() {
		return aucDAO.selectItemRecent();
	}
	public int itemInsert(ItemDTO item) {
		System.out.println(item);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDateStr = formatter.format(new Date());
		item.setCreate_date(currentDateStr);

	    String endDate=item.getEnd_date().replace("T", " ");
	    item.setEnd_date(endDate);
	    		
        
	    item.setUser_id("seoyeon");
		item.setCat(0);
		item.setImage1("test.png");
		
		System.out.println(item);
		return aucDAO.itemInsert(item);
	}
	public List<PokemonDTO> selectPCard() {
		return aucDAO.selectPCard();
	}
	public List<ItemDetailDTO> getSortedItemList(String sortOption) {
		if (sortOption == null) {
            return aucDAO.selectItemRecent();
        }
		switch (sortOption) {
		case "recent":
			return aucDAO.selectItemRecent();
		case "ending":
			return aucDAO.selectItemEnding();
		case "mostpeople":
			return aucDAO.selectItemMost();
		case "leastpeople":
			return aucDAO.selectItemLeast();
		default:
			return aucDAO.selectItemRecent();
		}
		
	}
	public int likeInsert(LikeDTO like) {
		return aucDAO.likeInsert(like);
	}
	
	public int likeDelete(Map<String, Object> paramMap) {
        return aucDAO.likeDelete(paramMap);
    }

    
	
}
