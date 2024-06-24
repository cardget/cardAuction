package com.cardproject.myapp.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cardproject.myapp.dto.BoardListDTO;
import com.cardproject.myapp.dto.CommunityDTO;
import com.cardproject.myapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	CommunityService cService;

	// 게시글 리스트 조회
	@GetMapping("/BoardSelect.do")
	public String BoardSelect(Model model) {
		System.out.println("/community/BoardSelect.do get 요청");

		List<BoardListDTO> blist = cService.selectBoardList();
		model.addAttribute("blist", blist);
		return "community/BoardSelect";
	}

	// 게시글 상세 조회
	@GetMapping("/BoardDetail.do")
	public String BoardDetail(Integer commId, Model model) {
		System.out.println("/community/BoardDetail.do get 요청");

		// s3 사용해야 이미지 공동으로 볼 수 있움 ..
		cService.updateViews(commId); // 조회수 기능
		model.addAttribute("board", cService.selectBoardByCommId(commId));
		return "community/BoardDetail";
	}

	// 게시글 등록 페이지 로드
	@GetMapping("/BoardInsert.do")
	public void BoardInsert() {
		System.out.println("/community/BoardInsert.do get 요청");
	}

	// 게시글 등록
	@PostMapping("/BoardInsert.do")
	public String BoardInsert(CommunityDTO board, MultipartHttpServletRequest file, HttpSession session) {
		board.setUser_id("guny1117"); // 로그인 기능 연동 후 session으로 교체

		// 이미지 등록
		HttpServletRequest request = (HttpServletRequest) file;
		String path = request.getSession().getServletContext().getRealPath("/");
		long time = System.currentTimeMillis();
		MultipartFile image = file.getFile("imageFile");
		File fileDir = new File(path);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		String originFileName = image.getOriginalFilename();
		String saveFileName = String.format("%d_%s", time, originFileName);
		board.setImage(saveFileName);
		try {
			image.transferTo(new File(path, saveFileName)); // wtp 서버 경로에 저장되므로, 이후에 s3 필요
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(path); // 임시 서버 저장 이미지 경로
		System.out.println(board); // 데이터 확인

		cService.insertBoard(board);
		return "redirect:BoardSelect.do";

	}

	// 게시글 수정 페이지 로드
	@GetMapping("/BoardModify.do")
	public String BoardModify(Integer commId, Model model) {
		System.out.println("/community/BoardModify.do get 요청");
		model.addAttribute("board", cService.selectBoardByCommId(commId));
		return "community/BoardModify";
	}

	// 게시글 수정
	@PostMapping("/BoardModify.do")
	public String BoardModify(CommunityDTO board, MultipartHttpServletRequest file, HttpSession session) {

		// 이미지 등록 or 수정
		HttpServletRequest request = (HttpServletRequest) file;
		String path = request.getSession().getServletContext().getRealPath("/");
		long time = System.currentTimeMillis();
		MultipartFile image = file.getFile("imageFile");
		File fileDir = new File(path);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		String originFileName = image.getOriginalFilename();
		String saveFileName = String.format("%d_%s", time, originFileName);
		board.setImage(saveFileName);
		try {
			image.transferTo(new File(path, saveFileName)); // wtp 서버 경로에 저장되므로, 이후에 s3 필요
		} catch (Exception e) {
			e.printStackTrace();
		}

		int commId = board.getComm_id();
		cService.modifyBoard(board);
		return "redirect:BoardDetail.do?commId=" + commId;
	}

	// 추천
	@GetMapping("/recommendUp.do")
	@ResponseBody
	public String Recommend(Integer commId) {
		System.out.println("/community/recommendUp.do 요청");
		cService.incrementRecommend(commId);
		int result = cService.getRecommendCount(commId);
		if (result > 0) {
			return String.valueOf(result);
		} else {
			return "fail";
		}
	}

	@GetMapping("/InquirySelect.do")
	public void InquirySelect() {

	}

	@GetMapping("/InquiryDetail.do")
	public void InquiryDetail() {
	}

	@GetMapping("/InquiryInsert.do")
	public void InquiryInsert() {
	}
}
