/*=========================
 	MemberController.java
 	- 사용자 정의 컨트롤러
 =============================*/
package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.mybatis.MemberDTO;

@Controller
public class MemberController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 주입을 위한 준비
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/memberlist.action", method= RequestMethod.GET)
	public String memberList(Model model)
	{
		String view = null;
		
		//IMemeberDAO dao = (IMemberDAO)sqlSession.getMapper(); 
		//위의 방법과 동일한 기능
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		//model.addAttribute("count", 인원수);
		model.addAttribute("count", dao.count());
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/WEB-INF/views/MemberList.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/memberinsert.action", method= RequestMethod.POST)
	public String memberInsert(MemberDTO m)
	{
		String view = "redirect:memberlist.action";
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.add(m);
		
		
		return view;
	}
	
	@RequestMapping(value = "/memberdelete.action", method= RequestMethod.GET)
	public String memberDelete(int mid)
	{
		String view = "redirect:memberlist.action";
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(mid);
		
		return view;
	}

	@RequestMapping(value = "/memberupdate.action", method= RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		String view ="redirect.memberlist.action";
		
		return view;
	}
	
	//로그인 
  @RequestMapping(value = "/login.action", method= RequestMethod.GET)
  public String login(Model model) 
  { 
	  String view = null;
  
	  view = "/WEB-INF/views/Login.jsp";
  
	  return view;
  }
	
  @RequestMapping(value = "/userlogin.action" ,method = {RequestMethod.POST, RequestMethod.GET })
	public String userlogin(Model model, HttpServletRequest request)
	{
		//System.out.println("test");
		String view = null; 
		//IMemberDAO dao = SqlSession.getMapper(IMemberDAO.class);
		
		// login.jsp 에서 id, pw 넘겨받기 
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		
		System.out.println(id + " " +pw);
	
		view = "/WEB-INF/views/MemberList.jsp";
		return view;
  }
}





















