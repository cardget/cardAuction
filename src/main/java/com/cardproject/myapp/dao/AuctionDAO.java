package com.cardproject.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.PokemonDTO;
@Repository
public class AuctionDAO {

	@Autowired
	SqlSession sqlSession;
	
	Logger logger = LoggerFactory.getLogger(AuctionDAO.class);
			
	String namespace = "com.cardproject.myapp.dao.";
	//테스트 : 모든 경매물품 조회
	public void test() {
		List<ItemDTO> var = sqlSession.selectList(namespace + "selectAllItems");
		System.out.println(var);
	}
	//경매물품 등록 items Insert
	public int itemInsert(ItemDTO item) {
		int result = sqlSession.insert(namespace+"itemInsert",item);
		logger.info(result+"건 추가됨");
		return result;
	}
	//카드조회
	public List<PokemonDTO> selectPCardName() {
		List<PokemonDTO> plist = sqlSession.selectList(namespace+"selectPCardName");
		logger.info(plist.size()+"건 조회됨");
		return plist;
	}
	
}
