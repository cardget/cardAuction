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
	



	@Scheduled(cron="0 0/1 * * * *")
	@Transactional
	public void scheduleRun() {
		System.out.println("scheduled task running...");
		List<ItemExpiredDTO> expiredItems = aucDAO.selectExpired();
		List<Integer> updateIsWinArr = new ArrayList<Integer>();
		
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
		List<Integer> isWinUpdate3ForBidIdArr = new ArrayList<Integer>();
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
		List<BiddingDTO> secondPriceListNot = aucDAO.secondPriceNot();
		
		int price = 0;
		String cmt = "";
		if(expiredItems.size() != 0) {
			for(ItemExpiredDTO item : expiredItems) {
				for(BiddingDTO bid : secondPriceList) {
					if(item.getItem_id() == bid.getItem_id()) {
						price = bid.getPrice();
						if(aucDAO.isTradeExist(bid.getItem_id())== null) {
							price =price + 1000;
							System.out.println("@@@@@@@@@@"+price);
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
			                    //판매자에게 낙찰알림
			                    cmt = "경매등록했던 물품이 낙찰되었습니다.";
			                    Map<String, Object> params = new HashMap<>();
								params.put("user_id", item.getSeller_id());
						    	params.put("item_id", bid.getItem_id());
						    	params.put("cmt",cmt);
						    	aucDAO.notificationInsert(params);
					
						    	//구매자에게 
						    	cmt = "입찰한 물품이 낙찰되었습니다.";
						    	Map<String, Object> params2 = new HashMap<>();
								params2.put("user_id", item.getCustomer_id());
						    	params2.put("item_id", bid.getItem_id());
						    	params2.put("cmt",cmt);
						    	aucDAO.notificationInsert(params2);
						}else {
							System.out.println("이미 거래내역에 있는 item_id");
						}
						
					}
				}
				
				for(BiddingDTO bid2 : secondPriceListNot) {
					if(item.getItem_id() == bid2.getItem_id()) {
						
						aucDAO.biddingUpdate3(item.getItem_id());
						
						//유찰된 item 판매자에게 알림 
						cmt = "입찰한 물품이 유찰되었습니다.";
						Map<String, Object> params = new HashMap<>();
						params.put("user_id", item.getSeller_id());
				    	params.put("item_id", item.getItem_id());
				    	params.put("cmt",cmt);
				    	aucDAO.notificationInsert(params);
					}
				}
			}
			
		}
		

		
		
	}
}
