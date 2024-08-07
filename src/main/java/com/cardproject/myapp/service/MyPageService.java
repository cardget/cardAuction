package com.cardproject.myapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cardproject.myapp.dao.MyPageDAO;
import com.cardproject.myapp.dto.BiddingResultDTO;
import com.cardproject.myapp.dto.DeliveryDTO;
import com.cardproject.myapp.dto.ItemDTO;
import com.cardproject.myapp.dto.NotificationDTO;
import com.cardproject.myapp.dto.PointDTO;
import com.cardproject.myapp.dto.TradeDTO;
import com.cardproject.myapp.dto.UserDTO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 내 정보
	public UserDTO selectUserById(String userid) {
		return myPageDAO.selectUserById(userid);
	}

	// 내 정보 수정
	public void userUpdate(UserDTO user) {
		myPageDAO.userUpdate(user);
	}

	// 프로필 이미지 수정
	public void userProfileUpdate(String userid, String imgpath) {
		myPageDAO.userProfileUpdate(userid, imgpath);
	}

	// 입찰내역
	public List<BiddingResultDTO> selectAllBids(String userid) {
		return myPageDAO.selectAllBids(userid);
	}

	// 입찰내역 삭제
	public int deleteAllBids(String userid) {
		return myPageDAO.deleteAllBids(userid);
	}

	// 판매내역
	public List<ItemDTO> selectAllSales(String userid) {
		return myPageDAO.selectAllSales(userid);
	}

	// 낙찰내역
	public List<TradeDTO> selectAllTrades(String userid) {
		return myPageDAO.selectAllTrades(userid);
	}

	// 포인트
	public List<PointDTO> selectPointByUser(String userid) {
		return myPageDAO.selectPointByUser(userid);
	}

	// 포인트 합계
	public int selectTotalPointByUser(String userid) {
		return myPageDAO.selectTotalPointByUser(userid);
	}

	// 카테고리별 포인트 합계
	public int selectTotalPointByCat(String userid, int cat) {
		return myPageDAO.selectTotalPointByCat(userid, cat);
	}

	// 관심목록
	public List<ItemDTO> selectAllLikes(String userid) {
		return myPageDAO.selectAllLikes(userid);
	}

	// 관심목록 삭제
	public int deleteAllLikes(String userid) {
		return myPageDAO.deleteAllLikes(userid);
	}

	// 배송조회
	public List<DeliveryDTO> selectAllDeliveries(String userid) {
		return myPageDAO.selectAllDeliveries(userid);
	}

	// 알림조회
	public List<NotificationDTO> selectAllNotifications(String userid) {
		return myPageDAO.selectAllNotifications(userid);
	}

	// 알림 상위 5개 조회
	public List<NotificationDTO> selectFiveNotifications(String userid) {
		return myPageDAO.selectFiveNotifications(userid);
	}

	// 알림 읽음 표시 업데이트
	public int isReadUpdate(int notificationid) {
		return myPageDAO.isReadUpdate(notificationid);
	}

	// 알림 삭제
	public int deleteNotification(int notificationid) {
		return myPageDAO.deleteNotification(notificationid);
	}

	// 모든 알림 읽음 표시로 변경
	public int isReadUpdateAll(String userid) {
		return myPageDAO.isReadUpdateAll(userid);
	}

	// 읽은 알림 전체 삭제
	public int deleteAllNotificationRead(String userid) {
		return myPageDAO.deleteAllNotificationRead(userid);
	}

	// 회원 탈퇴
	public int updateUserDisabled(String userid, String password) {
		UserDTO user = myPageDAO.selectUserById(userid);
		if (passwordEncoder.matches(password, user.getPw())) {
			return myPageDAO.updateUserDisabled(userid, user.getPw()); // 로그인 성공
		} else {
			return 0;
		}
	}
}
