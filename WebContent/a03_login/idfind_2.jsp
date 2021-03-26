<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLO</title>
<style>
a{ 	text-decoration:none;  color:black; color: inherit}
ul{list-style: none;}
.signin_content{
	margin:0 auto;	height:1000px;	}
#box{
	margin : 0 auto;	width : 620px;	height : 400px;	border : 1px solid lightgray;	margin-top : 150px;	}
#title{
	width : 200px; margin-left : 210px;	text-align : center; margin-top : 85px;	font-size : 30px;	font-weight : bold;}
#result{
	width : 400px; margin-left : 110px; margin-top : 30px; text-align : center; font-weight : bold; color : gray;
	font-size : 25px; line-height : 160%; letter-spacing : -2px; 
}
button:focus{
	outline : none; }
#goLoginBtn{
	width : 220px;	height : 60px;	background-color : #FF8533;	border : none;	margin-top : 40px;	margin-right: 10px; margin-left : 80px;}
#goPwfindBtn{
	width : 220px;	height : 60px;	background-color : lightgray;	border : none;}
span{
	font-weight:bold; color:#fff; font-size:15px;
}

</style>
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $("#goLoginBtn").on("click",function(){
    	  location.href="login.jsp";
      })
      $("#goPwfindBtn").on("click",function(){
    	  location.href="pwfind_1.jsp";
      })
      
   });
</script>
<%
	request.setCharacterEncoding("UTF-8");
	String user = (String)request.getAttribute("users");
%>
</head>
<body>
	<%@ include file="../a01_main/header.jsp" %>
	<div class="signin_content">	
		
		<div id="box">
			<div id="title">아이디 찾기</div>
			<%-- 	<div id="result">해당 이메일로 가입된 아이디는 <br> <%= user.getU_id() %> 입니다.</div> --%>
				<button id="goLoginBtn"><span>로그인</span></button>
				<button id="goPwfindBtn"><span>비밀번호 찾기 </span></button>
		</div>
	<%@ include file="../a01_main/footer.jsp" %>	
	</div>
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
</html>