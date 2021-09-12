<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- <html lang="en"> -->	
<!-- 이건 언어가 영어(en)로 작성되었다는 속성값 같은데, 우린 한글도 받아야하니까 주석처리할게요! -->
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="front/html/style.css" />	<!-- 파일 위치가 바뀌어서 경로 추가함 -->
    
    <title>회원가입</title>
    
    <!-- jquery CDN과 bootstrap.js 파일의 스크립트를 사용해서 내비게이션 바가 동작한다. -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="front/html/main.js" defer></script>
    <script src="https://kit.fontawesome.com/c7aa79f993.js" crossorigin="anonymous"></script>
    
    <!-- 5. 비밀번호 확인 function() => 이건 나중에 확인해보기!? -->
    <script type="text/javascript">
    	
    	function pwCheckFunction() {
//			alert('pwCheckFunction()');	// => function() 되는지 확인 후 주석처리
		}
    
    </script>
    
</head>

<body>

  	<!-- 1. 여기는 로그아웃 상태일 경우 브라우저에 표시할 내용 (로그인 하기 전 기본 화면) -->
    <!-- Header -->
    <header>
      <nav class="navbar">
        <div class="navbar_logo">
          <i class="fab fa-fort-awesome-alt"></i>
          <a class="navbar_brand", href="front/html/main.html">온동네가 키워요</a>	<!-- 경로 추가함 -->
          <a class="navbar_brandname", href="front/html/main.html">PetCity</a>		<!-- 경로 추가함 -->
        </div>
      </nav>
    </header>
    <div class = "memebrship">
    
      <!-- 2. form에서 action으로 넘겨줄 페이지 설정, method로 넘기는 방식(get/post) 설정 -->
      <form action="./UserRegister" method="post">	
        <h2>회원가입</h2>
        <table>
          <tr>
            <td class="mem">아이디</td>
            <td>
            	<input type = "text" required name="id">	<!-- 3. VO에 담아서 UserRegister에 보여줄 데이터 이름(name) 설정-->
            </td>
          </tr>
          <tr>
            <td class="mem">비밀번호</td>
            <td>
            	<input type = "password" required
            			id="pw1" 
            			name="pw1"
            			onkeyup="pwCheckFunction()"			
            	/>		<!-- 4. onkeyup="pwCheckFunction() => 비밀번호 확인하는 function() -->
            </td>
          </tr>
          <tr>
            <td class="mem">비밀번호 확인</td>
             <td>
            	<input type = "password" required 
            			id="pw2"
            			name="pw2"
            			onkeyup="pwCheckFunction()"			
            	/>		<!-- 위와 마찬가지. 비밀번호 확인 function() 은 위쪽 <head></head> 사이에 자바스크립트로 작성 (5)-->
            </td>
          </tr>
          <tr>
            <td class="mem">이름</td>
            <td><input type = "text" required name="name"></td>
          </tr>
          <tr>
            <td class="mem">이메일</td>
            <td><input type = "text" required name="email"></td>
          </tr>
          <tr>
            <td class="mem">닉네임</td>
            <td><input type = "text" required name="nickname"></td>		<!-- 여기까지 다 담았으면 UserRegister 서블릿에 가서 작업해준다. -->
          </tr>
        </table>

        <button class="signup">가입하기</button></div>

      </form>
    </div>


 	<!-- 6. form으로 UserRegister로 데이터를 넘긴 후, 작업성공 여부에 따라 메시지 출력하기 
				=> 이미 되어있는뎅...? 효원님과 확인하기! -->
				
<%
	  	
	String messageType = "";
	if (session.getAttribute("messageType") != null) {	//	
		messageType = (String) session.getAttribute("messageType");
		out.println("messageType : " + messageType + "<br/>");
	} 
	
	String messageContent = "";
	if (session.getAttribute("messageContent") != null) {	//	
		messageType = (String) session.getAttribute("messageContent");
		out.println("messageContent : " + messageContent + "<br/>");
	} 
	
	/* 메시지 내용이 비어있지 않다면 =>  */
	if (messageContent != null) {	
%> 
	<!-- 오류 메시지 띄울거면 여기에 팝업창이나 뭐... 그런 작업해두기! -->
	
	
		<!-- 오류가 났으니까, 세션에 저장된 정보를 지운다! -->
<% 
		session.removeAttribute("messageType");
		session.removeAttribute("messageContent");
	}
%>
	<!-- 로그인 메시지 모달 팝업창 -->
	
</body>
</html>