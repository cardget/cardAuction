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
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemDetailDTO;
import com.cardproject.myapp.dto.LikeDTO;
import com.cardproject.myapp.dto.PokemonDTO;
import com.cardproject.myapp.dto.TradeDTO;

@Repository
public class AuctionDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.cardproject.myapp.dao.";

	Logger logger = LoggerFactory.getLogger(AuctionDAO.class);

	// 경매리스트 조회 ( 최신순 )
	public List<ItemDetailDTO> selectItemRecent() {
		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemRecent");
		logger.info(itemDlist.size() + "건 조회됨.");
		return itemDlist;

	}

	// 경매리스트 조회 ( 종료임박순 )
	public List<ItemDetailDTO> selectItemEnding() {
		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemEnding");
		logger.info(itemDlist.size() + "건 조회됨.");
		return itemDlist;

	}

	// 경매리스트 조회 ( 참여자많은순 )
	public List<ItemDetailDTO> selectItemMost() {
		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemMost");
		logger.info(itemDlist.size() + "건 조회됨.");
		return itemDlist;

	}

	// 경매리스트 조회 ( 참여자적은순 )
	public List<ItemDetailDTO> selectItemLeast() {
		List<ItemDetailDTO> itemDlist = sqlSession.selectList(namespace + "selectItemLeast");
		logger.info(itemDlist.size() + "건 조회됨.");
		return itemDlist;

	}
	//경매물품 하나 Detail조회
	public ItemDetailDTO selectItemOne(int item_id) {
		ItemDetailDTO itemDetail = sqlSession.selectOne(namespace+"selectItemOne", item_id);
		logger.info(itemDetail.toString());
		return itemDetail;
	}

	// 경매물품 등록 items Insert
	public int itemInsert(ItemDTO item) {
		int result = sqlSession.insert(namespace + "itemInsert", item);
		logger.info(result + "건 추가됨.");
		return result;
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
	
	
	
	
	public void likeInsert(LikeDTO likeVO) {
        sqlSession.insert(namespace+"likeInsert", likeVO);
    }

    public void likeDelete(Map<String, Object> params) {
        sqlSession.delete(namespace+"likeDelete", params);
    }

    public LikeDTO likeStatus(Map<String, Object> params) {
        return sqlSession.selectOne(namespace+"likeStatus", params);
    }
    
}
