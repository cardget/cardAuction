package com.cardproject.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cardproject.myapp.dao.AuctionDAO;
import com.cardproject.myapp.dto.BiddingDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.ItemExpiredDTO;
import com.cardproject.myapp.dto.TradeDTO;

@Service
public class SchedulerService {
	
	@Autowired
	AuctionDAO aucDAO;
	
	@Scheduled(cron="0 0/30 * * * *")
	@Transactional
	public void scheduleRun() {
		System.out.println("scheduled task running...");
		List<ItemExpiredDTO> expiredItems = aucDAO.selectExpired();
		List<Integer> updateIsWinArr = new ArrayList<Integer>();
		//item_id가 똑같은 항목이 하나밖에 없으면 해당 금액으로 낙찰 
		//item_id가 같은 항목이 2개 이상이면 제일높은 금액의 biddings 낙찰 -> is_win=1로 update
		//item_id가 같은 항목의 biddings가 is_win 0인 것들은 2로 update
		
		System.out.println("***********************items:" + expiredItems);
		System.out.println("***********************size:" +expiredItems.size());
		if(expiredItems.size() != 0) {
			for(ItemExpiredDTO item : expiredItems) {
				updateIsWinArr.add(item.getBid_id());
			}
			
			int result = aucDAO.updateIsWin1(updateIsWinArr);
			
			System.out.println("총 " + result + "건 업데이트 됨");
		}
		
		
		List<ItemExpiredDTO> otherItems = aucDAO.getExpiredIsWin0();
		List<Integer> isWin0BidIdArr = new ArrayList<Integer>();
		
		if(otherItems.size() != 0) {
			for(ItemExpiredDTO item: otherItems) {
				isWin0BidIdArr.add(item.getBid_id());
			}
			
			int isWin0Result = aucDAO.biddingUpdate2(isWin0BidIdArr);
			
			System.out.println("나머지 총 " + isWin0Result + "건 업데이트 됨");
		}
		//item_id 마다 해당 낙찰금 뽑기 
		//해당낙찰금으로 set 
		List<BiddingDTO> secondPriceList = aucDAO.secondPrice();
		int price = 0;
		if(expiredItems.size() != 0) {
			for(ItemExpiredDTO item : expiredItems) {
				for(BiddingDTO bid : secondPriceList) {
					if(item.getItem_id() == bid.getItem_id()) {
						price = bid.getPrice();
						if(aucDAO.isTradeExist(bid.getItem_id())== null) {
							TradeDTO trade = new TradeDTO();
								trade.setUser_id(bid.getUser_id());
			                    trade.setItem_id(bid.getItem_id());
			                    trade.setPrice(price);
			                    trade.setTrade_type(0);
			                    trade.setIs_recommend(0);
			                    trade.setStage(0);
			                    trade.setIs_success(0);
			                    int insertResult = aucDAO.tradeInsert(trade);
			                    System.out.println(insertResult+"건 trade insert");
						}else {
							System.out.println("이미 거래내역에 있는 item_id");
						}
						
					}
				}
			}
		}
		//trades insert
//		Map<Integer, ItemExpiredDTO> maxPriceBids = new HashMap<>();
//		for (ItemExpiredDTO item : expiredItems) {
//	        int itemId = item.getItem_id();
//	        if (!maxPriceBids.containsKey(itemId) || item.getPrice() > maxPriceBids.get(itemId).getPrice()) {
//	                maxPriceBids.put(itemId, item);
//	                System.out.println("maxpricebids: "+maxPriceBids);
//	        }
//	    }
//		for (ItemExpiredDTO bid : maxPriceBids.values()) {
//			System.out.println("bid: " + bid);
//		}
		
		
//		int count;
//		//sysdate 지난 itemlist select
//		List<ItemDTO> expiredItems = aucDAO.selectExpiredItem();
//		for(ItemDTO item : expiredItems) {
//			System.out.println("expired item: " + item);
//			
//			//입찰조회
//			List<BiddingDTO> bids = aucDAO.selectBid(item.getItem_id());
//			System.out.println("입찰 : "+bids.size()+"건");
//			
//			
//			
//			if(bids.size() == 1) {
//				BiddingDTO singleBid = bids.get(0);
//                System.out.println("1개 입찰 정보 : " + singleBid);
//                if(singleBid.getIs_win() == 0) {
//                	 int updateResult = aucDAO.biddingUpdate(singleBid.getItem_id());
//                	 System.out.println(updateResult + "건 bidding update");
//                	 TradeDTO trade = new TradeDTO();
//                     trade.setUser_id(singleBid.getUser_id());
//                     trade.setItem_id(singleBid.getItem_id());
//                     trade.setPrice(singleBid.getPrice());
//                     trade.setTrade_type(0);
//                     trade.setIs_recommend(0);
//                     trade.setStage(0);
//                     trade.setIs_success(0);
//                     int insertResult = aucDAO.tradeInsert(trade);
//                     System.out.println(insertResult + "건 trade insert (단일 입찰에 대한 낙찰)");
//                }else {
//                	System.out.println("is_win=1 (이미 낙찰된 입찰정보)");
//                }
//                
//			}else {
//			count=0;
//			for(BiddingDTO bid : bids) {
//				System.out.println("Bid: " + bid);
//				//이미 낙찰상태인 bidding이 있는지 조회
//				BiddingDTO bidVerification = aucDAO.bidVerification(bid.getItem_id());
//				if(bidVerification!=null) {
//					count=1;
//				}
//				
//			}
//			if(count==0) {
//			//is_win 1로 update
//			int updateResult = aucDAO.biddingUpdate(item.getItem_id());
//			System.out.println(updateResult + "건 bidding update");
//			//낙찰 된 bidding가져오기
//			BiddingDTO bidOne = aucDAO.bidVerification(item.getItem_id());
//			//2번째 price 조회 
//			int secondPrice = aucDAO.secondPrice(item.getItem_id());
//			//trade set
//			TradeDTO trade = new TradeDTO();
//			trade.setUser_id(bidOne.getUser_id());
//			trade.setItem_id(bidOne.getItem_id());
//			trade.setPrice(secondPrice);
//			trade.setTrade_type(0);
//			trade.setIs_recommend(0);
//			trade.setStage(0);
//			trade.setIs_success(0);
//			//낙찰 insert
//			int insertResult = aucDAO.tradeInsert(trade);
//			System.out.println(insertResult+"건 trade insert");
//			}
//			}
//		
//		}
		
		
	}
}
