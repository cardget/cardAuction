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
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.dto.LikeDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PointDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.SportDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Service
public class AuctionService {

	@Autowired
	AuctionDAO aucDAO;
	
	
	 //포켓몬 경매리스트 검색해서 조회
	public List<ItemDetailDTO> selectItemForName(int page, int pageSize,String keyword,String sortOption) {
		return aucDAO.selectItemForName(page,pageSize,keyword,sortOption);
	}
	//포켓몬 조건에 따라 경매리스트 조회
	public List<ItemDetailDTO> getSortedItemList(int page, int pageSize,String sortOption) {
		return aucDAO.selectItemRecent(page, pageSize, sortOption);
	}
	//포켓몬 총 게시글 수 조회
	public int getTotalItemCount() {
		return aucDAO.getTotalItemCount();
	}
	//포켓몬 검색 게시글 수 조회
	public int getTotalItemCountByKeyword(String keyword) {
		return aucDAO.getTotalItemCountByKeyword(keyword);
	}
    //포켓몬 경매물품 detail조회
	public ItemDetailDTO selectItemOne(int item_id) {
		return aucDAO.selectItemOne(item_id);
	}
	//물품등록
	public int itemInsert(ItemDTO item) {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDateStr = formatter.format(new Date());
		item.setCreate_date(currentDateStr);

		String endDate = item.getEnd_date().replace("T", " ");
		item.setEnd_date(endDate);
		
		return aucDAO.itemInsert(item);
	}
	//입찰
	public int biddingInsert(BiddingDTO bid) {
		System.out.println(bid);
		
		return aucDAO.biddingInsert(bid);
	}
	//포켓몬 전체카드조회
	public List<PokemonDTO> selectPCard() {
		return aucDAO.selectPCard();
	}
	//포켓몬 카드검색
	public List<PokemonDTO> selectPRight(String cardKeyword){
		return aucDAO.selectPRight(cardKeyword);
	}
	public int selectCat(int item_id) {
		return aucDAO.selectCat(item_id);
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
    public int biddingPriceUpdate(int price, String user_id, Integer item_id) {
    	Map<String, Object> params = new HashMap<>();
    	params.put("price", price);
    	params.put("user_id", user_id);
    	params.put("item_id", item_id);
    	return aucDAO.biddingPriceUpdate(params);
    	
    	
    }
    public Integer myBidPrice(String user_id, Integer item_id) {
    	Map<String, Object> params = new HashMap<>();
    	params.put("user_id", user_id);
    	params.put("item_id", item_id);
    	return aucDAO.myBidPrice(params);
    }
    public boolean isLiked(String userId, int itemId) {
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
    
    
    //@@@@@@@@디지몬
    //디지몬 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameDigimon(int page, int pageSize,String keyword,String sortOption) {
  		return aucDAO.selectItemForNameDigimon(page,pageSize,keyword,sortOption);
  	}
    //조건에 따라 디지몬 경매리스트 조회
  	public List<ItemDetailDTO> selectItemDigimon(int page, int pageSize,String sortOption) {
  		return aucDAO.selectItemDigimon(page, pageSize, sortOption);
  	}
    //디지몬 총 게시글 수 조회
  	public int getTotalItemCountDigimon() {
  		return aucDAO.getTotalItemCountDigimon();
  	}
    //디지몬 검색 게시글 수 조회
  	public int getTotalItemCountByKeywordDigimon(String keyword) {
  		return aucDAO.getTotalItemCountByKeywordDigimon(keyword);
  	}
    //디지몬 경매물품 detail조회
  	public ItemDetailDTO selectItemOneDigimon(int item_id) {
  		return aucDAO.selectItemOneDigimon(item_id);
  	}
    //디지몬 카드검색
  	public List<DigimonDTO> selectDRight(String cardKeyword){
  		return aucDAO.selectDRight(cardKeyword);
  	}
  //@@@@@@@@원피스
    //원피스 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameOnepiece(int page, int pageSize,String keyword,String sortOption) {
  		return aucDAO.selectItemForNameDigimon(page,pageSize,keyword,sortOption);
  	}
    //조건에 따라 원피스 경매리스트 조회
  	public List<ItemDetailDTO> selectItemOnepiece(int page, int pageSize,String sortOption) {
  		return aucDAO.selectItemOnepiece(page, pageSize, sortOption);
  	}
    //원피스 총 게시글 수 조회
  	public int getTotalItemCountOnepiece() {
  		return aucDAO.getTotalItemCountOnepiece();
  	}
    //원피스 검색 게시글 수 조회
  	public int getTotalItemCountByKeywordOnepiece(String keyword) {
  		return aucDAO.getTotalItemCountByKeywordOnepiece(keyword);
  	}
    //원피스 경매물품 detail조회
  	public ItemDetailDTO selectItemOneOnepiece(int item_id) {
  		return aucDAO.selectItemOneOnepiece(item_id);
  	}
    //원피스 카드검색
  	public List<OnepieceDTO> selectORight(String cardKeyword){
  		return aucDAO.selectORight(cardKeyword);
  	}
  //@@@@@@@@유희왕
    //유희왕 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameYugioh(int page, int pageSize,String keyword,String sortOption) {
  		return aucDAO.selectItemForNameYugioh(page,pageSize,keyword,sortOption);
  	}
    //조건에 따라 유희왕 경매리스트 조회
  	public List<ItemDetailDTO> selectItemYugioh(int page, int pageSize,String sortOption) {
  		return aucDAO.selectItemYugioh(page, pageSize, sortOption);
  	}
    //유희왕 총 게시글 수 조회
  	public int getTotalItemCountYugioh() {
  		return aucDAO.getTotalItemCountYugioh();
  	}
    //유희왕 검색 게시글 수 조회
  	public int getTotalItemCountByKeywordYugioh(String keyword) {
  		return aucDAO.getTotalItemCountByKeywordYugioh(keyword);
  	}
    //유희왕 경매물품 detail조회
  	public ItemDetailDTO selectItemOneYugioh(int item_id) {
  		return aucDAO.selectItemOneYugioh(item_id);
  	}
    //유희왕 카드검색
  	public List<YugiohDTO> selectYRight(String cardKeyword){
  		return aucDAO.selectYRight(cardKeyword);
  	}
  //@@@@@@@@스포츠
    //스포츠 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameSport(int page, int pageSize,String keyword,String sortOption) {
  		return aucDAO.selectItemForNameSport(page,pageSize,keyword,sortOption);
  	}
    //조건에 따라 스포츠 경매리스트 조회
  	public List<ItemDetailDTO> selectItemSport(int page, int pageSize,String sortOption) {
  		return aucDAO.selectItemSport(page, pageSize, sortOption);
  	}
    //스포츠 총 게시글 수 조회
  	public int getTotalItemCountSport() {
  		return aucDAO.getTotalItemCountSport();
  	}
    //스포츠 검색 게시글 수 조회
  	public int getTotalItemCountByKeywordSport(String keyword) {
  		return aucDAO.getTotalItemCountByKeywordSport(keyword);
  	}
    //스포츠 경매물품 detail조회
  	public ItemDetailDTO selectItemOneSport(int item_id) {
  		return aucDAO.selectItemOneSport(item_id);
  	}
    //스포츠 카드검색
  	public List<SportDTO> selectSRight(String cardKeyword){
  		return aucDAO.selectSRight(cardKeyword);
  	}
  	
  	
}
