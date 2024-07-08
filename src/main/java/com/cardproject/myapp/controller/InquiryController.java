package com.cardproject.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cardproject.myapp.dto.QuestionDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	@Autowired
	InquiryService iService;
	@Autowired
	private AWSS3Service s3Service;

	// 문의 리스트 조회
	@GetMapping("/InquirySelect")
	public String InquirySelect(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize, Model model, HttpSession session) {

		// 유저 닉네임
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			UserDTO user = iService.selectNicknameByUserVOId(userid);
			session.setAttribute("user", user);
		}

		// 페이징
		int totalCount = iService.getTotalInquiryCount();
		List<QuestionDTO> ilist = iService.selectInquiryList(page, pageSize);

		// sort_num으로 번호 재설정
		int sortNum = 1;
		for (QuestionDTO inquiry : ilist) {
			inquiry.setSort_num(sortNum++);
		}

		for (QuestionDTO list : ilist) {
			System.out.println(list);
		}

		model.addAttribute("ilist", ilist);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageSize", pageSize);

		return "inquiry/InquirySelect";
	}

	// 문의 글 상세조회
	@GetMapping("/InquiryDetail")
	public String InquiryDetail(Integer questId, Model model, HttpSession session) {
		System.out.println("/inquiry/InquiryDetail 요청");

		int isManager = 0;
		
		// user 닉네임
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			UserDTO user = iService.selectNicknameByUserVOId(userid);
			session.setAttribute("user", user); // 세션에 user 객체 저장
		}

		QuestionDTO inquiry = iService.selectByInquiryId(questId); // 문의 글 정보
		Integer isSecret = inquiry.getIs_secret(); // 비밀글 여부
		String writer = iService.getWriterByQuestId(questId); // 글 작성자
		String answer = iService.checkAnswerByInquiryId(questId); // 답변 여부
		isManager = iService.checkManagerById(userid); // 관리자 여부
		
		model.addAttribute("inquiry", inquiry);
		model.addAttribute("answer", answer);
		model.addAttribute("isManager", isManager);
		if (userid == null) { // 비로그인
			if (isSecret == 1) {
				model.addAttribute("errorMessage", "열람할 수 없습니다.");
				return "inquiry/InquirySelect";
			} else {
				return "inquiry/InquiryDetail";
			}
		}
		
		if (isSecret == 1) { // 비밀글일 경우
			if (userid.equals(writer)) { // 작성자 접근
				return "inquiry/InquiryDetail";
			} else if (isManager == 1) { // 관리자 접근
				return "inquiry/InquiryDetail";
			} else if (userid.equals(null)) {
				model.addAttribute("errorMessage", "열람할 수 없습니다.");
				return "inquiry/InquirySelect";
			} else { // 그외 접근 불가
				model.addAttribute("errorMessage", "열람할 수 없습니다.");
				return "inquiry/InquirySelect";
			}
		}
		return "inquiry/InquiryDetail";
	}

	// 답변
	@PostMapping("/submitAnswer.do")
	public String submitAnswer(@RequestParam("questid") int questId, @RequestParam("answer") String answer) {
		iService.updateAnswer(questId, answer);
		return "redirect:/inquiry/InquiryDetail?questId=" + questId;
	}

	// 문의 글 등록 페이지 로드
	@GetMapping("/InquiryInsert.do")
	public void InquiryInsert(HttpSession session) {
		System.out.println("/inquiry/InquiryInsert get요청");

		// user 닉네임
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			UserDTO user = iService.selectNicknameByUserVOId(userid);
			session.setAttribute("user", user); // 세션에 user 객체 저장
		}
	}

	// 문의 글 등록
	@PostMapping("/InquiryInsert.do")
	public String InquiryInsert(QuestionDTO question, MultipartHttpServletRequest file, HttpSession session) {

		// 세션에서 사용자 ID 가져오기
		String userId = (String) session.getAttribute("userid");
		question.setUser_id(userId);

		// 체크박스 예외처리
		if (question.getIs_secret() == null) {
			question.setIs_secret(0);
		}

		// S3에 이미지 등록
		MultipartFile image = file.getFile("imageFile");
		if (image != null && !image.isEmpty()) {
			String fileName = "community/" + System.currentTimeMillis() + "_" + image.getOriginalFilename();
			try {
				String imageUrl = s3Service.uploadObject(image, fileName);

				// 이미지 URL이 https로 시작하는 경우 http로 변경
				if (imageUrl.startsWith("https")) {
					imageUrl = "http" + imageUrl.substring(5);
				}
				question.setImage(imageUrl);
			} catch (java.io.IOException e) {
				e.printStackTrace();
				// 이미지 업로드 중 오류 발생 시 처리
				return "redirect:InquiryInsertForm?error=upload";
			}
		}
		System.out.println(question);

		iService.insertInquiry(question);
		return "redirect:InquirySelect";
	}

	// 문의 글 삭제
	@GetMapping("/InquiryDelete.do")
	public String inquiryDelete(Integer questId, HttpSession session) {
		String userId = (String) session.getAttribute("userid");
		int isManager = iService.checkManagerById(userId);
		String writer = iService.getWriterByQuestId(questId);

		if (writer.equals(userId) || isManager == 1) {
			iService.deleteInquiry(questId);
			return "redirect:InquirySelect";
		} else {
			session.setAttribute("errorMessage", "작성자와 관리자만 삭제할 수 있습니다.");
		}

		return "redirect:InquirySelect";
	}

}
