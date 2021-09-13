<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <html> -->
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="front/html/style.css" />
    <title>로그인</title>
    <script src="main.js" defer></script>
    <script src="https://kit.fontawesome.com/c7aa79f993.js" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 2. 데이터가 넘어갈 수 있도록 jsp 코드로 써주자 -->
<%
	request.setCharacterEncoding("UTF-8");	// 2-1) post 방식으로 데이터가 넘어올 때 한글깨짐 방지용
//	2-2) login 버튼이 클릭되면 넘어오는 데이터(id, pw)를 받는다.
//	2-3) 단, 이전페이지가 없을 때, NullPointerException이 발생하지 않도록 예외처리를 해준다. 
	String id = "";
	String pw = "";
	try {	
		id = request.getParameter("user_id").trim();
		pw = request.getParameter("user_pw").trim();	
	} catch (NullPointerException e) {
	
	}	

//	2-4) id가 hong이고 pw가 123456이면 로그인 처리한다.
	out.println("<script>");

	if (id.equals("hong") && pw.equals("123456")) {
//		로그인 처리
//		2-6) 로그인 되었으므로 로그인 정보를 session에 저장한다.
		session.setAttribute("id", id);
		session.setAttribute("name", "관리자");
		session.setAttribute("login", "yes");
		
		out.print("alert('" + session.getAttribute("name") + "님 어서오세요!')");
	} else if (id.length() + pw.length() != 0){		//	=> id와 pw의 합이 0이 아니면~

//		2-5) 로그인 에러 메시지
		out.print("alert('아이디 또는 비밀번호가 올바르지 않습니다.')");
	}
	out.println("</script>");
	
//	3-3) 로그아웃 버튼이 클릭되면 넘어오는 데이터를 받는다.
	String logout = request.getParameter("logout");

//	3-4) 로그아웃 정보가 넘어왔으면 로그아웃 처리를 한다.
	if (logout != null && logout.equals("yes")) {
		out.println("<script>");
		out.print("alert('" + session.getAttribute("name") + "님이 로그아웃 되셨습니다!')");
		out.println("</script>");
		
//		3-5) 로그아웃 되었으므로 session에서 로그인 정보를 제거한다.
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("login");
	}
	
//	2-7) session에서 로그인 정보를 읽어와서 로그인 상태, 로그아웃 상태의 화면을 브라우저에 표시한다.
	String login = (String)session.getAttribute("login");
	if (login != null && login.equals("yes")) {
%>		
		<!-- 3. 로그인 상태일 경우 브라우저에 표시할 내용 -->
		<!-- 3-1) 로그인 되었을 때 보여줄 글을 아래 써주고 -->
		로그인 성공<br/>
		<%=session.getAttribute("name")%>님 안녕하세요.<br/>	<!-- jsp 표현식 버전 -->
		${name}님 안녕하세요.<br/>								<!-- el 버전 -->
		<!-- 3-2) 로그아웃 버튼도 넣어준다. -->
		<input type="button" value="로그아웃" onclick="location.href='?logout=yes'"/>


	<!-- 3-0) 로그아웃이 되었을 때의 모습은 처음 보여지는 화면이 포함되어야하니까
			여기선 else{}안에 1번 화면을 다 담아주고 }를 마지막에 닫아준다. (스파게티 코드네ㅠ)
			여긴 디자이너랑 작업할때 el사용해서 좀 더 깔끔하게 처리하기로 하자! -->
<%		
	} else {
%>
	<!-- 1. 로그아웃 상태일 경우 브라우저에 표시할 내용을 만들어준다. -->

    <!-- Header --->
    <header>
      <nav class="navbar">
        <div class="navbar_logo">
          <i class="fab fa-fort-awesome-alt"></i>
          <a class="navbar_brand", href="front/html/main.html">온동네가 키워요</a>
          <a class="navbar_brandname", href="front/html/main.html">PetCity</a>
        </div>
      </nav>
    </header>
    <div class = "login1">
      <form action="./UserRegister" method="post">	<!-- form에서 넘겨줘야할 페이지 설정!!!  -->
        <h2>로그인</h2>
        <table>
          <tr>
            <td class="mem">아이디</td>
            <td>
            <input type = "text" required name="id">	<!-- form에 넘겨줄 데이터 이름(name) 설정-->
            </td>
          </tr>
          <tr>
            <td class="mem">비밀번호</td>
            <td><input type = "password" required name="pw"></td>
          </tr>
          <tr>
        </table>

        <button class="login">click</button></div>

      </form>
    </div>
<%
	}
%>


</body>
</html>