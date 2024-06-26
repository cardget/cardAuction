package com.cardproject.myapp.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.AuctionDAO;
import com.cardproject.myapp.dto.BiddingDTO;
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

		String endDate = item.getEnd_date().replace("T", " ");
		item.setEnd_date(endDate);
		
		
		item.setCat(0);
		//item.setImage1("test.png");

		System.out.println(item);
		return aucDAO.itemInsert(item);
	}
	public int biddingInsert(BiddingDTO bid) {
		System.out.println(bid);
		
		return aucDAO.biddingInsert(bid);
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
	public boolean addLike(String userId, Integer itemId) {
        try {
        	LikeDTO like = new LikeDTO();
            like.setUser_id(userId);
            like.setItem_id(itemId);
            aucDAO.likeInsert(like);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean removeLike(String userId, Integer itemId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("user_id", userId);
            params.put("item_id", itemId);
            aucDAO.likeDelete(params);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean isLiked(String userId, Integer itemId) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", userId);
        params.put("item_id", itemId);
        LikeDTO like = aucDAO.likeStatus(params);
        return like != null;
    }
	
    public boolean isBidding(String userId, Integer itemId) {
    	Map<String, Object> params = new HashMap<>();
    	params.put("user_id", userId);
        params.put("item_id", itemId);
        BiddingDTO bid = aucDAO.userBidsForItem(params);
        System.out.println("isBidding result for userId: " + userId + " and itemId: " + itemId + " -> " + (bid != null));
    	return bid != null; //입찰한경우 true, 아닌경우 false
    }
    public boolean isSeller(String userId, Integer itemId) {
    	Map<String, Object> params = new HashMap<>();
    	params.put("user_id", userId);
        params.put("item_id", itemId);
        ItemDTO item = aucDAO.sellerBidsForItem(params);
        System.out.println("isBidding result for userId: " + userId + " and itemId: " + itemId + " -> " + (item != null));
    	return item != null; //자신의 경매물품일경우 true, 아닌경우 false
    }
}
