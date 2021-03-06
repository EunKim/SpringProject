package com.test.first.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.first.mapper.dto.board.BoardInfoVO;
import com.test.first.mapper.dto.common.ResponseDTO;
import com.test.first.mapper.dto.member.MemberInfoVO;
import com.test.first.service.board.ChattingBoardService;
import com.test.first.service.board.Pager;
import com.test.first.service.member.MemberInfoService;

@Controller
public class MemberInfoController {

	@Inject
	MemberInfoService memberinfoService;
	@Inject
	ChattingBoardService chattingBoardService;

	// mian.jsp로 갈수 있는 컨트롤
	@RequestMapping("member/main.do")
	public String mainPage() {
		return "main";
	}

	// 메인에서 -> 회원가입 누를시 회원가입 폼이있는 info/member_write.jsp로 이동시켜줌
	@RequestMapping("member/newlogin.do")
	public String writeFirst() {
		return "info/member_write";
	}

	// 회원정보 수정시 비밀번호 수정하기를 눌렀을때 나타나는 창의 jsp
	@RequestMapping("member/updatepwd.do")
	public String updatepwd() {
		return "info/updatepwd";
	}

	// 회원정보 수정시 이름 수정하기를 눌렀을때 나타나는 창의 jsp
	@RequestMapping("member/updateName.do")
	public String updateName() {
		return "info/updateName";
	}

	// 메인에서 -> 회원가입 확인버튼 누른다음에 회원정보가 db에 입력이 되면 로그인 하는 부분으로 이동.
	@RequestMapping("member/insertlist.do")
	public String insertFirst(@ModelAttribute MemberInfoVO vo) {
		memberinfoService.insertMember(vo);
		return "redirect:/member/main.do";
	}

	// 회원가입시 아이디 중복 확인용
	@ResponseBody
	@RequestMapping(value = "member/selectId.do", method = RequestMethod.POST)
	public ResponseDTO checkId(String member_id) {
		ResponseDTO responseDTO = new ResponseDTO(); // 성공,실패 코드 등록, 메세지 보낼꺼 처리
		System.out.println("1차");
		boolean result = memberinfoService.isAvailableId(member_id);

		if (result == true) {
			responseDTO.setCode(-1);
			responseDTO.setMsg("이미 존재하는 ID 입니다.");
		} else {
			responseDTO.setCode(99);
			responseDTO.setMsg("사용 가능한  ID 입니다.");
		}

		return responseDTO;
	}

	// 회원가입시 이름(닉네임) 확인용
	@ResponseBody
	@RequestMapping(value = "member/selectName.do", method = RequestMethod.POST)
	public ResponseDTO checkName(String member_name) {
		ResponseDTO responseDTO = new ResponseDTO(); // 성공,실패 코드 등록, 메세지 보낼꺼 처리

		boolean result = memberinfoService.isAvailableName(member_name);

		if (result == true) {
			responseDTO.setCode(-1);
			responseDTO.setMsg("이미 존재하는 닉네임 입니다.");
		} else {
			responseDTO.setCode(99);
			responseDTO.setMsg("사용 가능한  닉네임 입니다.");
		}

		return responseDTO;
	}

	// 로그인시 확인버튼을 누를때 입력한 정보가 db에 있는 정보인지 아닌지 확인
	@RequestMapping("member/login_check.do")
	@ResponseBody
	public boolean login_check(@ModelAttribute MemberInfoVO vo, HttpSession session) { // session
																						// :
																						// 로그인접속시간,할떄
																						// 필요
		boolean result = memberinfoService.loginConfirm(vo, session);
		return result;
	}

	// 회원정보에서 회원의 비밀번호가 맞으면 회원탈퇴후에 정보도 삭제하면서 로그아웃처리(세션처리)
	@RequestMapping("member/deleteuser.do")
	public ModelAndView delete(@ModelAttribute MemberInfoVO vo, HttpSession session, Model model) {

		boolean result = memberinfoService.checkPw(vo.getMember_id(), vo.getMember_pw()); // 회원의
																							// 비밀번호가
																							// 맞는지
																							// 먼저
																							// 확인.

		if (result) {// 정보가 맞으면 해당 회원의 정보를 db에서 삭제하고, 로그아웃 처리
			memberinfoService.deleteMember(vo.getMember_id(), session);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("main");
			mav.addObject("message", "logout");
			System.out.println("성공");
			return mav;

		} else {
			System.out.println("실패");
			ModelAndView mav = new ModelAndView();
			model.addAttribute("dto", memberinfoService.viewMember(vo.getMember_id()));
			mav.setViewName("info/mypage");
			mav.addObject("messageDelete", "삭제실패!비밀번호가 일치하지 않습니다.");
			return mav;
		}

	}

	// 회원정보에서 회원정보 수정 누를시 회원정보를 수정할수있는 jsp로 넘어가는것.
	@RequestMapping("member/updateuserinfo.do")
	public String updateUser(String member_id, Model model) {

		model.addAttribute("dto", memberinfoService.viewMember(member_id));
		return "info/member_update";
	}

	// 실질적으로 회원정보를 수정 하는 부분
	@RequestMapping("member/updateuser.do")
	public String update(@ModelAttribute MemberInfoVO vo) {

		memberinfoService.updateMember(vo);
		// model.addAttribute("dto",vo);
		return "redirect:/member/logout.do";

	}

	// 로그아웃을 눌렀을때 로그아웃 처리
	@RequestMapping("member/logout.do")
	public String logout(HttpSession session) {
		memberinfoService.logout(session);
		return "redirect:/member/main.do";
	}

	// 맨위 이름(닉네임)에서 선택하면 회원정보를 알수있는 부분 -> 회원정보(아이디값)를 가지고, info/mypage에 해당에
	// 맞게 정보를 뿌려줌.
	@RequestMapping("member/mypage.do")
	public ModelAndView goMypage(@RequestParam(defaultValue = "1") int curPage, String member_id, Model model) {

		// 레코드 갯수 계산
		int postcount = chattingBoardService.postingCountByMe(member_id);
				
		// 페이지 나누기 관련 처리
		Pager pager = new Pager(postcount, curPage);
		System.out.println("현재페이지: " + curPage);
		int start = pager.getPageBegin();
		// end : limit에서 갯수만 나타내기 위해서 PAGE_SCALE(목록)에 뿌려질 갯수만 지정
		int end = pager.PAGE_SCALE;
		
		Map<String, Object> map = new HashMap<String, Object>();

		// 내 정보
		map.put("dto", memberinfoService.viewMember(member_id));

		// 내가 쓴 최신 게시글 5개 뽑아내기
		map.put("myRecentPost", chattingBoardService.postingByMeLimit4(member_id));

		// 내가 쓴 게시글 목록
		map.put("myAllpost", chattingBoardService.postingByMe(member_id, start, end));
		System.out.println(chattingBoardService.postingByMe(member_id, start, end).size());

		// 내가 쓴 게시글 총 갯수
		map.put("postCount", postcount);
		
		//페이징 처리
		map.put("pager", pager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("info/mypage");

		return mav;
	}

	/*
	 * // 맨위 이름(닉네임)에서 선택하면 회원정보를 알수있는 부분 -> 회원정보(아이디값)를 가지고, info/mypage에 해당에
	 * // 맞게 정보를 뿌려줌.
	 * 
	 * @RequestMapping("member/viewuser.do") public String view(String
	 * member_id, Model model) {
	 * 
	 * model.addAttribute("dto", memberinfoService.viewMember(member_id));
	 * return "info/mypage"; }
	 */

	// 회원 정보에서 비밀번호 수정시에 필요
	@RequestMapping("member/update_pwd.do")
	@ResponseBody
	public boolean updatePw(String member_id, String member_pw) {
		// boolean result = memberinfoService.checkPw(uid, upw);
		memberinfoService.updatePwd(member_id, member_pw);
		return true;
		// return "redirect:/member/updatepwd.do";
	}

}

/*
 * // 메인에서 -> 회원관리 누를시 나타나는 멤버 리스트
 * 
 * @RequestMapping("member/list.do") public String memberList(Model model) {
 * List<MemberInfoVO> list = memberinfoService.memberList();
 * model.addAttribute("list", list); return "info/member_info"; }
 */

// 로그인시 확인버튼을 누를때 입력한 정보가 db에 있는 정보인지 아닌지 확인
/*
 * @RequestMapping("member/login_check.do") public ModelAndView
 * login_check(@ModelAttribute MemberInfoVO vo, HttpSession session) { //session
 * : 로그인접속시간,할떄 필요 System.out.println("들어온곳"); boolean result =
 * memberinfoService.loginConfirm(vo, session); ModelAndView mav = new
 * ModelAndView(); if (result == true) {// 로그인 성공 mav.setViewName("main");
 * mav.addObject("message", "success"); } else {// 로그인 실패
 * mav.setViewName("main"); mav.addObject("message", "error"); } return mav; }
 */

// 로그아웃을 눌렀을때 로그아웃 처리
/*
 * @RequestMapping("member/logout.do") public ModelAndView logout(HttpSession
 * session) { memberinfoService.logout(session); ModelAndView mav = new
 * ModelAndView(); mav.setViewName("main"); mav.addObject("message", "logout");
 * //굳이 필요하지는 않음. return mav; }
 */

// 회원정보창에서 회원정보를 수정하고 수정버튼을 누르면, 비밀번호가 회원정보와 일치하는지 확인하고 비밀번호가 맞으면 수정된 정보를 다시
// 회원정보창에 넣어 뿌려줌.
/*
 * @RequestMapping("member/updateuser.do") public String update(@ModelAttribute
 * MemberInfoVO vo, Model model) { //비밀번호 체크 boolean result =
 * memberinfoService.checkPw(vo.getUid(), vo.getUpw()); //해당되는 아이디의 비밀번호가 맞는지 확인
 * if(result){//맞으면 회원정보 수정 memberinfoService.updateMember(vo);
 * //model.addAttribute("dto",vo); return "redirect:/member/logout.do";
 * }else{//일치하지 않을시에, 해당 메세지를 뿌려줌 model.addAttribute("dto",vo);
 * model.addAttribute("messageUpdate","수정실패!비밀번호가 일치하지 않습니다."); return
 * "info/member_update"; }
 * 
 * }
 */
