package com.member.service;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserRegister() {
        super();
       }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegister 서블릿의 doGet() 메소드");
		actionDo(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegister 서블릿의 doPost() 메소드");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegister 서블릿 연결");
		System.out.println("UserRegister 서블릿의 actionDo() 메소드");
		
//		1) 한글로 넘어오는 데이터 한글깨짐 방지
		request.setCharacterEncoding("UTF-8");
//		2) 한글로된 데이터를 넘겨줄 때 한글깨짐 방지
		response.setContentType("text/html; charset=UTF-8");
		
//		3) form에서 넘어오는 데이터 받아주기
		String id = request.getParameter("id");	// login form에서 설정한 키워드로 넣어준다.
//		System.out.println(id);					// 맞게 넘어왓는지 확인 후 주석표시
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		
//		4) 입력체크하기! (null 이거나 공백이 들어가지 않도록!)
		if (id == null || id.trim().equals("") || 
			pw1 == null || pw1.trim().equals("") ||
			pw2 == null || pw2.trim().equals("") ||
			name == null || name.trim().equals("") ||
			email == null || email.trim().equals("") ||
			nickname == null || nickname.trim().equals("")) {
			
//			4-2) 작업의 성공 여부에 따른 메시지를 session에 저장한다.
//			=> getSession() 메소드로 서블릿에서 세션을 얻어온다. (jsp파일에선 내장객체라서 session. 으로 찍으면 나오지만 서블릿에선 이렇게 해야함)
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요");
			
//			4-3) 성공하지 못할 경우 이전 화면으로 돌려보낸다 (여기선 signup.jsp 겠지?)
			response.sendRedirect("signup.jsp");	// 왜 forward가 아니고 redirect를 쓸까? session에 담긴 내용을 가져가도록 해야하기 때문에!! forward는 request에 있는 데이터를 가져가는것!

//			4-4) 이 이후 할 일이 없으니 return 시킨다.
			return;
			
		}	//	if 입력체크 끝 
//				=> sendRedirect로 돌려보낸 화면(여기선 signup.jsp)에 가서 메시지가 뜨는지 확인한다.
		
		
//		5) 비번 체크!
		if (!pw1.trim().equals(pw2.trim())) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다.");
			response.sendRedirect("signup.jsp");
			return;
		}
		
//		6) 넘어온 데이터가 정상이므로 MemberVO 클래스 객체를 만들어 저장한다.
		MemberVO vo = new MemberVO(id, pw1, name, email, nickname);
//		System.out.println(vo);
		
//		7) 테이블에 회원 정보를 저장하는 메소드를 실행한다. => DAO 필요! DAO를 만들고 하자!
//		new MemberDAO();	//	=> 콘솔에 연결 성공 나오는지 확인하기!
//		확인하고 나면 DAO에 오류인지 아닌지 숫자(정상1/오류-1)로 판단하게 설정했으니, 적당한 변수를 만들어서 메소드를 실행하게 하자!
		int result = new MemberDAO().signUp(vo);
//		System.out.println(result);		//	=> 확인되면 주석처리 해준다.
		
		
//		8) 잘 되었으면 메시지를 띄워준다.
		if (result == 1) {
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
			response.sendRedirect("signup.jsp");
			return;
		} else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.(아이디 중복)");
			response.sendRedirect("signup.jsp");
			return;
		}
		
		
	}	//	actionDo() 끝

}
