package com.test.first.controller.member;

import java.util.List;

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

import com.test.first.mapper.dto.common.ResponseDTO;
import com.test.first.mapper.dto.member.MemberInfoVO;
import com.test.first.service.member.MemberInfoService;

@Controller
public class MemberInfoController {

	@Inject
	MemberInfoService memberinfoService;

	// 메인에서 -> 회원관리 누를시 나타나는 멤버 리스트
	@RequestMapping("member/list.do")
	public String memberList(Model model) {
		List<MemberInfoVO> list = memberinfoService.memberList();
		model.addAttribute("list", list);
		return "info/member_info";
	}
	

	// 메인에서 -> 회원가입 누를시 회원가입 폼이있는 info/member_write.jsp로 이동시켜줌
	@RequestMapping("member/newlogin.do")
	public String writeFirst() {
		return "info/member_write";
	}

	// 메인에서 -> 회원가입 확인버튼 누른다음에 회원정보가 db에 입력이 되면 로그인 하는 부분으로 이동.
	@RequestMapping("member/insertlist.do")
	public String insertFirst(@ModelAttribute MemberInfoVO vo) {
		memberinfoService.insertMember(vo);
		return "main";
	}
	

	// 로그인시 확인버튼을 누를때 입력한 정보가 db에 있는 정보인지 아닌지 확인
	@RequestMapping("member/login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberInfoVO vo, HttpSession session) { //session : 로그인접속시간,할떄 필요
		System.out.println("들어온곳");
		boolean result = memberinfoService.loginConfirm(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) {// 로그인 성공
			mav.setViewName("main");
			mav.addObject("message", "success");
		} else {// 로그인 실패
			mav.setViewName("main");
			mav.addObject("message", "error");
		}
		return mav;
	}

	
	// 로그아웃을 눌렀을때 로그아웃 처리
	@RequestMapping("member/logout.do")
	public ModelAndView logout(HttpSession session) {
		memberinfoService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("message", "logout"); //굳이 필요하지는 않음.
		return mav;
	}

	// 맨위 이름(닉네임)에서  선택하면 회원정보를 알수있는 부분 -> 회원정보(아이디값)를 가지고, info/member_view에 해당에 맞게 정보를 뿌려줌.
	@RequestMapping("member/viewuser.do")
	public String view(String uid, Model model) {
		System.out.println("클릭한 아이디 : " + uid);

		model.addAttribute("dto", memberinfoService.viewMember(uid));
		return "info/member_view";
	}
	
	
	// 회원정보창에서  회원정보를 수정하고 수정버튼을 누르면, 비밀번호가 회원정보와 일치하는지 확인하고 비밀번호가 맞으면 수정된 정보를 다시 회원정보창에 넣어 뿌려줌.
	@RequestMapping("member/updateuser.do")
	public String update(@ModelAttribute MemberInfoVO vo, Model model) {
		//비밀번호 체크
		boolean result = memberinfoService.checkPw(vo.getUid(), vo.getUpw()); //해당되는 아이디의 비밀번호가 맞는지 확인
		if(result){//맞으면 회원정보 수정
			memberinfoService.updateMember(vo);
			return "main";
		}else{//일치하지 않을시에, 해당 메세지를 뿌려줌
			model.addAttribute("dto",vo);
			model.addAttribute("messageUpdate","수정실패!비밀번호가 일치하지 않습니다.");
			return "info/member_view";
		}
		
		
	}

	//회원정보에서 회원의 비밀번호가 맞으면 회원탈퇴후에 정보도 삭제하면서 로그아웃처리(세션처리)
	@RequestMapping("member/deleteuser.do")
	public ModelAndView delete(@ModelAttribute MemberInfoVO vo, HttpSession session, Model model) {
		
		boolean result = memberinfoService.checkPw(vo.getUid(), vo.getUpw()); //회원의 비밀번호가 맞는지 먼저 확인.
		
		if(result){//정보가 맞으면 해당 회원의 정보를 db에서 삭제하고, 로그아웃 처리
			memberinfoService.deleteMember(vo.getUid(), session);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("main");
			mav.addObject("message", "logout");
			return mav;
			
		}else{
			ModelAndView mav = new ModelAndView();
			model.addAttribute("dto",memberinfoService.viewMember(vo.getUid()));
			mav.setViewName("info/member_view");
			mav.addObject("messageDelete", "삭제실패!비밀번호가 일치하지 않습니다.");
			return mav;
		}
	
	}

	//회원가입시 아이디 중복 확인용 
	@ResponseBody
	@RequestMapping(value="member/selectId.do",method=RequestMethod.POST)
	public ResponseDTO checkId(String uid){
		ResponseDTO responseDTO = new ResponseDTO(); //성공,실패 코드 등록, 메세지 보낼꺼 처리
		
		boolean result = memberinfoService.isAvailableId(uid);
		
		if(result == true){
			responseDTO.setCode(-1);
			responseDTO.setMsg("이미 존재하는 ID 입니다.");
		}else{
			responseDTO.setCode(99);
			responseDTO.setMsg("사용 가능한  ID 입니다.");
		}
		
		return responseDTO;
	}
	
	//회원가입시 이름(닉네임) 확인용
	@ResponseBody
	@RequestMapping(value="member/selectName.do",method=RequestMethod.POST)
	public ResponseDTO checkName(String uname){
		ResponseDTO responseDTO = new ResponseDTO(); //성공,실패 코드 등록, 메세지 보낼꺼 처리
		
		boolean result = memberinfoService.isAvailableName(uname);
		
		if(result == true){
			responseDTO.setCode(-1);
			responseDTO.setMsg("이미 존재하는 닉네임 입니다.");
		}else{
			responseDTO.setCode(99);
			responseDTO.setMsg("사용 가능한  닉네임 입니다.");
		}
		
		return responseDTO;
	}

}
