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
	margin : 0 auto;	width : 620px;	height : 450px;	border : 1px solid lightgray;	margin-top : 150px; margin-bottom:300px;	}
.logo{
	width : 72px;	height : 32px;  margin-left : -274px;	margin-left : 45%;	margin-top : 80px;	}
#text1{
	font-size : 30px; font-weight : bold; text-align : center; margin-top : 60px;}
#text2{
	font-size : 30px; font-weight : bold; text-align : center; margin-top : 20px;}
#btnGp{
	width : 330px; height : 50px; margin-left : 145px; margin-top : 50px;
	}
#loginBtn{
	width : 150px;	height : 50px;	background-color : #FF8533;	border : none; margin-right : 20px;	
	}
#loginBtn:focus{
	outline : none; }
#mainBtn{
	width : 150px;	height : 50px;	background-color : #FF8533;	border : none; }
#mainBtn:focus{
	outline : none; }
</style>

<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>

</head>
<body>
	<%@ include file="../a01_main/header.jsp" %>
	<div class="signin_content">
		
		<div id="box">
			<img class="logo" src="${path}/z00_imgs/logo.png"/>
			<br>
			<div id="text1">가입을</div>
			<div id="text2">축하드립니다.</div>
			<div id="btnGp">
				<button id="loginBtn"><span style="font-weight:bold; color:#fff; font-size:15px;">로그인</span></button>
				<button id="mainBtn"><span style="font-weight:bold; color:#fff; font-size:15px;">메인화면</span></button>
			</div>
		</div>
	</div>
	<%@ include file="../a01_main/footer.jsp" %>	
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
<script type="text/javascript">
   $(document).ready(function(){
	   $("#loginBtn").on("click",function(){
	    	  location.href="${path}/a03_login/login.jsp";
	   })
	   $("#mainBtn").on("click",function(){
	    	  location.href="${path}/a01_main/main.jsp";
	   })  

   });
</script>
</html>