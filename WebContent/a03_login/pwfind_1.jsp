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
	margin : 0 auto;	margin-top : 150px; width : 620px;	height : 440px;	border : 1px solid lightgray;}
#title{
	width : 200px; margin-left : 210px;	text-align : center; margin-top : 75px;	font-size : 30px;	font-weight : bold;}
#pwfindTable{
	width : 400px;	height : 220px;	margin-top: 40px; margin-left : 110px; font-size:14px;}		
#pwfindTable td{
	padding : 5px; }
.input{
	box-shadow : 0px; width : 390px; height: 40px; border-bottom :1px solid lightgray;	border-top : none;	border-left : none;	border-right : none; font-size:13px; }
.input:focus{
	outline : none; }
#pwfindBtn{
	width : 400px;	height : 50px;	background-color : #FF8533;	border : none; color : #000; margin-top : 20px;}

#pwfindBtn[type=submit]{
	color : #fff; font-weight : bold;
}
#pwfindBtn:focus{
	outline : none; }

</style>
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      
   });
</script>
</head>
<body>
	<%@ include file="../a01_main/header.jsp" %>
	<div class="signin_content">
			
		<div id="box">
			<div id="title">비밀번호 찾기</div>
			<form method="post"> 
				<table id="pwfindTable" >	
					<tr><td><input type="text" name="name" class="input" placeholder="&nbsp;아이디"></td></tr>
					<tr><td><input type="text" name="id" class="input" placeholder="&nbsp;이름"></td></tr>
					<tr><td><input type="password" name="pw" class="input" placeholder="&nbsp;이메일주소"></td></tr>	
					<tr><td><input type="submit" value="다음" id="pwfindBtn"></td></tr>
				</table>
			</form>		
		</div>
	<%@ include file="../a01_main/footer.jsp" %>
	</div>
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
</html>