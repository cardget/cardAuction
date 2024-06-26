package com.cardproject.myapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cardproject.myapp.dto.BiddingResultDTO;
import com.cardproject.myapp.dto.DeliveryDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.NotificationDTO;
import com.cardproject.myapp.dto.PointDTO;
import com.cardproject.myapp.dto.TradeDTO;
import com.cardproject.myapp.dto.UserDTO;

@Repository
public class MyPageDAO{

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.cardproject.myapp.dao";

	// 내 정보
	public UserDTO selectUserById(String userid) {
        return sqlSession.selectOne(namespace + ".selectUserById", userid);
    }

	// 내 정보 수정
	public int userUpdate(UserDTO user){
		return sqlSession.update(namespace + ".userUpdate", user);
	}
	
	// 프로필 이미지 수정
	public int userProfileUpdate(String userid, String imgpath) {
		Map<String, Object> params = new HashMap<>();
		params.put("userid", userid);
		params.put("imgpath", imgpath);
		return sqlSession.update(namespace + ".userProfileUpdate", params);
	}

	// 입찰내역
	public List<BiddingResultDTO> selectAllBids(String userid) {
		return sqlSession.selectList(namespace + ".selectAllBids", userid);
	}
	
	// 낙찰내역
	public List<TradeDTO> selectAllTrades(String userid) {
		return sqlSession.selectList(namespace + ".selectAllTrades", userid);
	}
	
	// 판매내역
	public List<ItemDTO> selectAllSales(String userid) {
		return sqlSession.selectList(namespace + ".selectAllSales", userid);
	}
	
	// 포인트
	public List<PointDTO> selectPointByUser(String userid) {
		return sqlSession.selectList(namespace + ".selectPointByUser", userid);
	}
	
	// 포인트 합계
	public int selectTotalPointByUser(String userid) {
		return sqlSession.selectOne(namespace + ".selectTotalPointByUser", userid);
	}
	
	// 카테고리별 포인트 합계
	public int selectTotalPointByCat(String userid, int cat) {
		Map<String, Object> params = new HashMap<>();
		params.put("userid", userid);
		params.put("cat", cat);
		return sqlSession.selectOne(namespace + ".selectTotalPointByCat", params);
	}
	
	// 관심목록
	public List<ItemDTO> selectAllLikes(String userid) {
		return sqlSession.selectList(namespace + ".selectAllLikes", userid);
	}
	
	// 관심목록 삭제
	public int deleteAllLikes(String userid) {
		return sqlSession.delete(namespace + ".deleteAllLikes", userid);
	}
	
	// 배송조회
	public List<DeliveryDTO> selectAllDeliveries(String userid) {
		return sqlSession.selectList(namespace + ".selectAllDeliveries", userid);
	}
	
	// 알림조회
	public List<NotificationDTO> selectAllNotifications(String userid) {
		return sqlSession.selectList(namespace + ".selectAllNotifications", userid);
	}
	
	// 알림 상위 5개 조회
	public List<NotificationDTO> selectFiveNotifications(String userid){
		return sqlSession.selectList(namespace + ".selectFiveNotifications", userid);
	}
	
	// 알림 읽음 표시 업데이트
	public int isReadUpdate(int notificationid) {
		return sqlSession.update(namespace + ".isReadUpdate", notificationid);
	}
	
	// 알림 삭제
	public int deleteNotification(int notificationid) {
		return sqlSession.delete(namespace + ".deleteNotification", notificationid);
	}
	
	// 모든 알림 읽음 표시로 변경
	public int isReadUpdateAll(String userid) {
		return sqlSession.update(namespace + ".isReadUpdateAll", userid);
	}
	
	// 읽은 알림 전체 삭제
	public int deleteAllNotificationRead(String userid) {
		return sqlSession.delete(namespace + ".deleteAllNotificationRead", userid);
	}
}
