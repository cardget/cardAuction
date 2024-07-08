package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.BiddingDTO;
import com.cardproject.myapp.dto.DigimonDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.dto.ItemExpiredDTO;
import com.cardproject.myapp.dto.LikeDTO;
import com.cardproject.myapp.dto.OnepieceDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.SportDTO;
import com.cardproject.myapp.dto.TradeDTO;
import com.cardproject.myapp.dto.YugiohDTO;

@Repository
public class AuctionDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.cardproject.myapp.dao.";

	Logger logger = LoggerFactory.getLogger(AuctionDAO.class);
	//포켓몬 경매리스트 검색해서 조회
	public List<ItemDetailDTO> selectItemForName(int page, int pageSize,String keyword,String sortOption) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> params = new HashMap<>();
		params.put("offset", offset);
		params.put("pageSize", pageSize);
		params.put("keyword", keyword);
		params.put("sortOption", sortOption);
		List<ItemDetailDTO> itemDlistForName = sqlSession.selectList(namespace + "selectItemForName",params);
		logger.info(itemDlistForName.size() + "건 조회됨.");
		return itemDlistForName;

	}
	//포켓몬 경매리스트 조회 ( 조건에 따라 조회 )
	public List<ItemDetailDTO> selectItemRecent(int page, int pageSize,String sortOption) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> params = new HashMap<>();
		params.put("offset", offset);
		params.put("pageSize", pageSize);
		params.put("sortOption", sortOption);
		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemRecent",params);
		logger.info(itemDlist.size() + "건 조회됨.");
		return itemDlist;

	}
	//pokemon 전체 item 수 
	public int getTotalItemCount() {
		return sqlSession.selectOne(namespace + "getTotalItemCount");
	}
	//pokemon 검색 item 수 
	public int getTotalItemCountByKeyword(String keyword) {
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		return sqlSession.selectOne(namespace + "getTotalItemCountByKeyword", params);
		
	}

	//경매물품 하나 Detail조회
	public ItemDetailDTO selectItemOne(int item_id) {
		ItemDetailDTO itemDetail = sqlSession.selectOne(namespace+"selectItemOne", item_id);
		logger.info(itemDetail.toString());
		return itemDetail;
	}
	//포켓몬 카드 검색
    public List<PokemonDTO> selectPRight(String cardKeyword){
    	List<PokemonDTO> pSelectlist = sqlSession.selectList(namespace + "selectPRight",cardKeyword);
		logger.info(pSelectlist.size() + "건 조회됨.");
		return pSelectlist;
    }

	// 경매물품 등록 items Insert
	public int itemInsert(ItemDTO item) {
		int result = sqlSession.insert(namespace + "itemInsert", item);
		logger.info(result + "건 추가됨.");
		return result;
	}
	//카테고리 select
	public int selectCat(int item_id) {
		return sqlSession.selectOne(namespace+"selectCat",item_id);
	}
	
	// 입찰 biddings insert
	public int biddingInsert(BiddingDTO bid) {
		int result = sqlSession.insert(namespace + "biddingInsert", bid);
		logger.info(result+"건 추가됨.");
		return result;
	}
	public BiddingDTO userBidsForItem(Map<String, Object> params) {
		return sqlSession.selectOne(namespace + "userBidsForItem", params);
	}
	public ItemDTO sellerBidsForItem(Map<String, Object> params) {
		return sqlSession.selectOne(namespace +"sellerBidsForItem",params);
	}
	// 포켓몬 카드 조회
	public List<PokemonDTO> selectPCard() {
		List<PokemonDTO> plist = sqlSession.selectList(namespace + "selectPCard");
		logger.info(plist.size() + "건 조회됨.");
		return plist;
	}
	//sysdate 지난 itemlist select
	public List<ItemDTO> selectExpiredItem() {
		List<ItemDTO> itemlist = sqlSession.selectList(namespace + "selectExpiredItem");
		logger.info(itemlist.size()+" 건 조회.");
		return itemlist;
	}
	//입찰 조회
	public List<BiddingDTO> selectBid(int item_id){
		List<BiddingDTO> bidlist = sqlSession.selectList(namespace+"selectBid",item_id);
		logger.info(bidlist.size()+" 건 조회.");
		return bidlist;
	}
	//낙찰여부 
	public BiddingDTO bidVerification(int item_id){
		BiddingDTO bidV = sqlSession.selectOne(namespace+"bidVerification",item_id);
		
		return bidV;
	}
	//낙찰여부 update
	public int biddingUpdate(int item_id) {
		int result = sqlSession.update(namespace+"biddingUpdate",item_id);
		logger.info(result+"건 update");
		return result;
	}
	//2번째 price 
	public int secondPrice(int item_id) {
		int secondPrice = sqlSession.selectOne(namespace+"secondPrice",item_id);
		logger.info("낙찰금 : "+secondPrice);
		return secondPrice;
	}
	//낙찰내역 insert
	public int tradeInsert(TradeDTO trade) {
		int result = sqlSession.insert(namespace+"tradeInsert",trade);
		logger.info(result+"건 insert");
		return result;
	}
	//낙찰되지 않은 입찰 정보 조회
	 public List<ItemExpiredDTO> selectExpired(){
		 
		 return sqlSession.selectList(namespace+"selectExpired");
	 }
	//입찰금 수정하기 
	public int biddingPriceUpdate(Map<String, Object> params) {
		return sqlSession.update(namespace+"biddingPriceUpdate",params);
	}
	//자신의 입찰금 불러오기
	public Integer myBidPrice(Map<String, Object> params) {
		return sqlSession.selectOne(namespace+"myBidPrice",params);
	}
	public void likeInsert(LikeDTO likeVO) {
        sqlSession.insert(namespace+"likeInsert", likeVO);
    }

    public void likeDelete(Map<String, Object> params) {
        sqlSession.delete(namespace+"likeDelete", params);
    }

    public LikeDTO likeStatus(Map<String, Object> params) {
        return sqlSession.selectOne(namespace+"likeStatus", params);
    }
    
    public int updateIsWin1(List<Integer> bidIdArr) {
    	return sqlSession.update(namespace + "updateIsWin1", bidIdArr);
    }
    
    // 낙찰 처리 후 나머지 입찰 내역
    public List<ItemExpiredDTO> getExpiredIsWin0() {
    	return sqlSession.selectList(namespace + "getExpiredIsWin0");
    }
    
    public int biddingUpdate2(List<Integer> isWin0BidIdArr) {
    	return sqlSession.update(namespace + "biddingUpdate2", isWin0BidIdArr);
    }
    public int biddingUpdate3(List<Integer> isWinUpdate3ForBidIdArr) {
    	return sqlSession.update(namespace + "biddingUpdate3", isWinUpdate3ForBidIdArr);
    }
    public List<BiddingDTO> secondPrice(){
    	return sqlSession.selectList(namespace+"secondPrice");
    }
    public List<BiddingDTO> secondPriceNot(){
    	return sqlSession.selectList(namespace+"secondPriceNot");
    }
    public int notificationInsert(Map<String, Object> params) {
    	return sqlSession.insert(namespace+"notificationInsert", params);
    }
    
    public TradeDTO isTradeExist(int item_id) {
    	return sqlSession.selectOne(namespace+"isTradeExist",item_id);
    	
    }
    
    //@@@@@@@@@@디지몬
    //디지몬 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameDigimon(int page, int pageSize,String keyword,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("keyword", keyword);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlistForName = sqlSession.selectList(namespace + "selectItemForNameDigimon",params);
  		logger.info(itemDlistForName.size() + "건 조회됨.");
  		return itemDlistForName;

  	}
    //디지몬 경매리스트 조회 ( 조건에 따라 조회 )
  	public List<ItemDetailDTO> selectItemDigimon(int page, int pageSize,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemDigimon",params);
  		logger.info(itemDlist.size() + "건 조회됨.");
  		return itemDlist;

  	}
    //digimon 전체 item 수 
  	public int getTotalItemCountDigimon() {
  		return sqlSession.selectOne(namespace + "getTotalItemCountDigimon");
  	}
    //digimon 검색 item 수 
  	public int getTotalItemCountByKeywordDigimon(String keyword) {
  		Map<String, Object> params = new HashMap<>();
  		params.put("keyword", keyword);
  		return sqlSession.selectOne(namespace + "getTotalItemCountByKeywordDigimon", params);
  		
  	}
  	//digimon 경매물품 하나 Detail조회
  	public ItemDetailDTO selectItemOneDigimon(int item_id) {
  		ItemDetailDTO itemDetail = sqlSession.selectOne(namespace+"selectItemOneDigimon", item_id);
  		logger.info(itemDetail.toString());
  		return itemDetail;
  	}
    //디지몬 카드 검색
    public List<DigimonDTO> selectDRight(String cardKeyword){
    	List<DigimonDTO> dSelectlist = sqlSession.selectList(namespace + "selectDRight",cardKeyword);
		logger.info(dSelectlist.size() + "건 조회됨.");
		return dSelectlist;
    }
    //@@@@@@@@@@원피스
    //원피스 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameOnepiece(int page, int pageSize,String keyword,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("keyword", keyword);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlistForName = sqlSession.selectList(namespace + "selectItemForNameOnepiece",params);
  		logger.info(itemDlistForName.size() + "건 조회됨.");
  		return itemDlistForName;

  	}
    //원피스 경매리스트 조회 ( 조건에 따라 조회 )
  	public List<ItemDetailDTO> selectItemOnepiece(int page, int pageSize,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemOnepiece",params);
  		logger.info(itemDlist.size() + "건 조회됨.");
  		return itemDlist;

  	}
    //원피스 전체 item 수 
  	public int getTotalItemCountOnepiece() {
  		return sqlSession.selectOne(namespace + "getTotalItemCountOnepiece");
  	}
    //원피스 검색 item 수 
  	public int getTotalItemCountByKeywordOnepiece(String keyword) {
  		Map<String, Object> params = new HashMap<>();
  		params.put("keyword", keyword);
  		return sqlSession.selectOne(namespace + "getTotalItemCountByKeywordOnepiece", params);
  		
  	}
  	//원피스 경매물품 하나 Detail조회
  	public ItemDetailDTO selectItemOneOnepiece(int item_id) {
  		ItemDetailDTO itemDetail = sqlSession.selectOne(namespace+"selectItemOneOnepiece", item_id);
  		logger.info(itemDetail.toString());
  		return itemDetail;
  	}
    //원피스 카드 검색
    public List<OnepieceDTO> selectORight(String cardKeyword){
    	List<OnepieceDTO> oSelectlist = sqlSession.selectList(namespace + "selectORight",cardKeyword);
		logger.info(oSelectlist.size() + "건 조회됨.");
		return oSelectlist;
    }
  //@@@@@@@@@@유희왕
    //유희왕 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameYugioh(int page, int pageSize,String keyword,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("keyword", keyword);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlistForName = sqlSession.selectList(namespace + "selectItemForNameYugioh",params);
  		logger.info(itemDlistForName.size() + "건 조회됨.");
  		return itemDlistForName;

  	}
    //유희왕 경매리스트 조회 ( 조건에 따라 조회 )
  	public List<ItemDetailDTO> selectItemYugioh(int page, int pageSize,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemYugioh",params);
  		logger.info(itemDlist.size() + "건 조회됨.");
  		return itemDlist;

  	}
    //유희왕 전체 item 수 
  	public int getTotalItemCountYugioh() {
  		return sqlSession.selectOne(namespace + "getTotalItemCountYugioh");
  	}
    //유희왕 검색 item 수 
  	public int getTotalItemCountByKeywordYugioh(String keyword) {
  		Map<String, Object> params = new HashMap<>();
  		params.put("keyword", keyword);
  		return sqlSession.selectOne(namespace + "getTotalItemCountByKeywordYugioh", params);
  		
  	}
  	//유희왕 경매물품 하나 Detail조회
  	public ItemDetailDTO selectItemOneYugioh(int item_id) {
  		ItemDetailDTO itemDetail = sqlSession.selectOne(namespace+"selectItemOneYugioh", item_id);
  		logger.info(itemDetail.toString());
  		return itemDetail;
  	}
    //유희왕 카드 검색
    public List<YugiohDTO> selectYRight(String cardKeyword){
    	List<YugiohDTO> ySelectlist = sqlSession.selectList(namespace + "selectYRight",cardKeyword);
		logger.info(ySelectlist.size() + "건 조회됨.");
		return ySelectlist;
    }
  //@@@@@@@@@@스포츠
    //스포츠 경매리스트 검색해서 조회
  	public List<ItemDetailDTO> selectItemForNameSport(int page, int pageSize,String keyword,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("keyword", keyword);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlistForName = sqlSession.selectList(namespace + "selectItemForNameSport",params);
  		logger.info(itemDlistForName.size() + "건 조회됨.");
  		return itemDlistForName;

  	}
    //스포츠 경매리스트 조회 ( 조건에 따라 조회 )
  	public List<ItemDetailDTO> selectItemSport(int page, int pageSize,String sortOption) {
  		int offset = (page - 1) * pageSize;
  		Map<String, Object> params = new HashMap<>();
  		params.put("offset", offset);
  		params.put("pageSize", pageSize);
  		params.put("sortOption", sortOption);
  		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemSport",params);
  		logger.info(itemDlist.size() + "건 조회됨.");
  		return itemDlist;

  	}
    //스포츠 전체 item 수 
  	public int getTotalItemCountSport() {
  		return sqlSession.selectOne(namespace + "getTotalItemCountSport");
  	}
    //스포츠 검색 item 수 
  	public int getTotalItemCountByKeywordSport(String keyword) {
  		Map<String, Object> params = new HashMap<>();
  		params.put("keyword", keyword);
  		return sqlSession.selectOne(namespace + "getTotalItemCountByKeywordSport", params);
  		
  	}
  	//스포츠 경매물품 하나 Detail조회
  	public ItemDetailDTO selectItemOneSport(int item_id) {
  		ItemDetailDTO itemDetail = sqlSession.selectOne(namespace+"selectItemOneSport", item_id);
  		logger.info(itemDetail.toString());
  		return itemDetail;
  	}
    //스포츠 카드 검색
    public List<SportDTO> selectSRight(String cardKeyword){
    	List<SportDTO> sSelectlist = sqlSession.selectList(namespace + "selectSRight",cardKeyword);
		logger.info(sSelectlist.size() + "건 조회됨.");
		return sSelectlist;
    }
    
    
}
