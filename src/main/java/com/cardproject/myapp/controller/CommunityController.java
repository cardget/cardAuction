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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cardproject.myapp.dto.BoardListDTO;
import com.cardproject.myapp.dto.CommunityDTO;
import com.cardproject.myapp.dto.ReplieDTO;
import com.cardproject.myapp.dto.UserDTO;
import com.cardproject.myapp.service.AWSS3Service;
import com.cardproject.myapp.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	CommunityService cService;
	@Autowired
	private AWSS3Service s3Service;

	// 게시글 리스트 조회 (조건검색 + 페이징)
	@GetMapping("/BoardSelect")
	public String BoardSelect(@RequestParam(defaultValue = "1") int page,
	                          @RequestParam(defaultValue = "10") int pageSize,
	                          @RequestParam(defaultValue = "date") String sort,
	                          @RequestParam(required = false) String keyword,
	                          @RequestParam(defaultValue = "all") String tag,
	                          @RequestParam(required = false) String cat, 
	                          Model model, HttpSession session) {
	    System.out.println("/community/BoardSelect get 요청");

	 // user 닉네임
	    String userid = (String) session.getAttribute("userid");
	    if (userid != null) {
	        UserDTO user = cService.selectNicknameByUserDTOId(userid);
	        session.setAttribute("user", user);
	    }
	    
	    // cat 값이 빈 문자열인 경우 예외처리
	    Integer category = (cat == null || cat.isEmpty() || "null".equals(cat)) ? null : Integer.parseInt(cat);


	    // 페이징 + 조건검색
	    int totalCount = (keyword != null && !keyword.isEmpty()) || (tag != null && !tag.equals("all"))
	            ? cService.getTotalBoardCount(keyword, tag, category)
	            : cService.getTotalBoardCount(category);

	    // 공지글
	    List<BoardListDTO> notices = category != null ? cService.selectTopNotices(category)
	                                                  : cService.selectTopNotices();

	    // 일반 게시글 (공지글 제외)
	    List<BoardListDTO> blist = cService.selectBoardList(page, pageSize, sort, keyword, tag, category);
	    blist.removeIf(board -> "공지".equals(board.getTag()));

	    // 일반 게시글 sort_num 재설정
	    int sortNum = (page - 1) * pageSize + 1;
	    for (BoardListDTO board : blist) {
	        board.setSort_num(sortNum++);
	    }

	    // 1번 페이지 공지글 병합
	    if (page == 1) {
	        blist.addAll(0, notices);
	    }

	    model.addAttribute("blist", blist);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("sort", sort);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("tag", tag);
	    model.addAttribute("cat", category);

	    return "community/BoardSelect";
	}
	
	// 게시글 상세 조회
	@GetMapping("/BoardDetail")
	public String BoardDetail(Integer commId, Model model, HttpSession session) {
		System.out.println("/community/BoardDetail get 요청");

		int isWriter = 0;
		int isManager = 0;

		BoardListDTO board = cService.selectBoardByCommId(commId);

		// user 닉네임
		String userId = (String) session.getAttribute("userid");

		if (userId != null) {
			UserDTO user = cService.selectNicknameByUserDTOId(userId);
			session.setAttribute("user", user); // 세션에 user 객체 저장
			isManager = cService.checkManagerByIdInCommunity(userId); // 매니저 1

			if (userId.equals(cService.getWriterByCommId(commId))) {
				isWriter = 1;
			}
		}

		cService.updateViews(commId); // 조회수 기능
		model.addAttribute("board", board);
		model.addAttribute("isManager", isManager); // 1이면 삭제, URL 복사 가능
		model.addAttribute("isWriter", isWriter); // 1이면 수정, 삭제, URL 복사 가능
		return "community/BoardDetail";
	}

	// 게시글 등록 페이지 로드
	@GetMapping("/BoardInsert.do")
	public void BoardInsert(HttpSession session, Model model) {
		System.out.println("/community/BoardInsert get 요청");

		// user 닉네임
		String userId = (String) session.getAttribute("userid");

		// 매니저 여부 체크
		int isManager = cService.checkManagerByIdInCommunity(userId);

		if (userId != null) {
			UserDTO user = cService.selectNicknameByUserDTOId(userId);
			session.setAttribute("user", user); // 세션에 user 객체 저장
		}
		model.addAttribute("isManager", isManager);
	}

	// 게시글 등록
	@PostMapping("/BoardInsert.do")
	public String BoardInsert(CommunityDTO board, MultipartHttpServletRequest file, HttpSession session) {

		// 세션에서 사용자 ID 가져오기
		String userId = (String) session.getAttribute("userid");
		board.setUser_id(userId);
		int cat = board.getCat();

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
				board.setImage(imageUrl);
			} catch (java.io.IOException e) {
				e.printStackTrace();
				// 이미지 업로드 중 오류 발생 시 처리
				return "redirect:BoardInsertForm?error=upload";
			}
		}
		System.out.println(board);

		// 게시글 등록
		cService.insertBoard(board);
		return "redirect:BoardSelect?cat=" + cat;
	}

	// 게시글 수정 페이지 로드
	@GetMapping("/BoardModify.do")
	public String BoardModify(Integer commId, Model model) {
		System.out.println("/community/BoardModify get 요청");
		model.addAttribute("board", cService.selectBoardByCommId(commId));
		return "community/BoardModify";
	}

	// 게시글 수정
	@PostMapping("/BoardModify.do")
	public String BoardModify(CommunityDTO board, MultipartHttpServletRequest file, HttpSession session) {
		System.out.println("/community/BoardModify post 요청");

		// 이미지 등록 or 수정
		MultipartFile image = file.getFile("imageFile");
		if (image != null && !image.isEmpty()) {
			String fileName = "community/" + System.currentTimeMillis() + "_" + image.getOriginalFilename();
			try {
				String imageUrl = s3Service.uploadObject(image, fileName);

				// 이미지 URL이 https로 시작하는 경우 http로 변경
				if (imageUrl.startsWith("https")) {
					imageUrl = "http" + imageUrl.substring(5);
				}
				board.setImage(imageUrl);
			} catch (java.io.IOException e) {
				e.printStackTrace();
				// 이미지 업로드 중 오류 발생 시 처리
				return "redirect:BoardInsertForm?error=upload";
			}
		}

		int commId = board.getComm_id();
		cService.modifyBoard(board);
		return "redirect:BoardDetail?commId=" + commId;
	}

	// 게시글 삭제
	@GetMapping("/BoardDelete.do")
	public String BoardDelete(Integer commId) {
		cService.deleteRepliesByCommId(commId); // 게시글에 대한 댓글 전부 삭제(cascade)
		cService.deleteBoard(commId);
		return "redirect:BoardSelect";
	}

	// 추천
	@GetMapping("/recommendUp.do")
	@ResponseBody
	public String Recommend(Integer commId) {
		System.out.println("/community/recommendUp 요청");
		cService.incrementRecommend(commId); // 조회수 증가
		int result = cService.getRecommendCount(commId); // 증가된 조회수
		if (result > 0) {
			return String.valueOf(result);
		} else {
			return "fail";
		}
	}

	// 댓글 리스트 조회
	@GetMapping("/getReplieList")
	@ResponseBody
	public List<ReplieDTO> selectReplieList(Integer commId) {
		System.out.println("/community/getReplieList 요청");

		List<ReplieDTO> rlist = cService.selectReplieList(commId);
		return rlist;
	}

	// 댓글 수 조회
	@GetMapping("/getReplieCount")
	@ResponseBody
	public int getReplieCount(Integer commId) {
		System.out.println("/community/getReplieCount 요청");

		return cService.getReplieCount(commId);
	}

	// 댓글 작성
	@PostMapping("/insertReplie.do")
	@ResponseBody
	public String insertReplie(@RequestParam Integer commId, @RequestParam String cmt, @RequestParam String userId) {
		System.out.println("/community/insertReplie 요청");

		ReplieDTO replie = new ReplieDTO();
		replie.setComm_id(commId);
		replie.setCmt(cmt);
		replie.setUser_id(userId);

		System.out.println(replie);

		int result = cService.insertComment(replie);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 세션으로 닉네임 조회
	@PostMapping("/selectNicknameById")
	@ResponseBody
	public String selectNicknameById(@RequestParam String userid) {
		System.out.println("selectNicknameById 요청");
		System.out.println("닉네임조회  " + cService.selectNicknameById(userid));
		return cService.selectNicknameById(userid);
	}

	// 댓글 삭제
	@PostMapping("/deleteComment.do")
	@ResponseBody
	public String DeleteComment(@RequestParam int replyId, @RequestParam int commId) {
		System.out.println("replyId : 테스트" + replyId);
		int val = cService.deleteComment(replyId);
		if (val == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

}
