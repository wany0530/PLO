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
#loginTable{
	width : 400px;	height : 220px;	margin-top: 70px; margin-left : 110px; font-size:14px;}		
#loginTable td{
	padding : 5px; }
.input{
	box-shadow : 0px; width : 390px; height: 40px; border-bottom :1px solid lightgray;	border-top : none;	border-left : none;	border-right : none; font-size:13px; }
.input:focus{
	outline : none; }
#loginBtn{
	width : 400px;	height : 50px;	background-color : #FF8533;	border : none; color : #fff; font-weight : bold;}
#loginBtn:focus{
	outline : none; }
#btnGp{
	width : 400px;	margin-left : 110px; color : gray;}
#btnGp a{
	 color: inherit; text-decoration: none;}
</style>
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
</head>
<body>	
 	<c:if test="${ loginResult == -1||loginResult == 0 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀렸습니다.");
		</script>
	</c:if>

	<%@ include file="../a01_main/header.jsp" %>
	<div class="signin_content">		
		<div id="box">
			<form method="post" action="<%=request.getContextPath()%>/login.do"> <!-- action="login.do" -->
				<table id="loginTable" >	
					<tr><td><input type="text" name="id" class="input" placeholder="&nbsp;아이디"></td></tr>
					<tr><td><input type="password" name="pass" class="input" placeholder="&nbsp;비밀번호"></td></tr>	
					<tr><td><input type="submit" value="로그인" id="loginBtn"></td></tr>
				</table>
			</form>	
			<div id="btnGp">
				<a href="${path}/a03_login/idfind_1.jsp"> 아이디 찾기</a>
				<a href="${path}/a03_login/pwfind_1.jsp">비밀번호찾기</a> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${path}/a03_login/signin_1.jsp" id="joinBtn">회원가입</a>
			</div>		
		</div>
		<%@ include file="../a01_main/footer.jsp" %>
		
	</div>
	<%@ include file="../a09_playList/musicplayer.jsp" %>

</body>
<script type="text/javascript">
   $(document).ready(function(){	   	   
	   document.querySelector("form").onsubmit=function(){
   		var id=document.querySelector("[name=id]");
   		var pass=document.querySelector("[name=pass]");
   		if(id.value==""){
   			alert("아이디를 입력하세요");
   			
   			return false;
   		}
   		else if(pass.value==""){
   			alert("비밀번호를 입력하세요");
   			return false;
   		}		
   	};
   }   
</script>
</html>