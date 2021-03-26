<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/z01_css/default.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<style type="text/css" >

	#main-header {
		display:flex;
		width:1450px;
		margin-left:76px;
	  	padding: 35px 0;
	}
	.genre-icons {
	  	background: white;
	  	border: 1px solid rgba(0, 0, 0, 0.2);
	  	border-radius: 16px;
	  	flex: 1 1 0;
	  	margin: 8px;
	  	height: 32px;
	  	font-size: 10pt;
	}
	.genre-icons:focus{
		background:orange;
		color:white;
		outline:none;
	}
	.genre-icons:hover {
		  border: 1px solid orange;
		  color: gray;
		  cursor:pointer;
	}
	
	a{    
		text-decoration:none;  
		color:black; 
		color: inherit;
	}
	.stor_login{
		position:relative;
		width:100%;
		text-align:center;
	}
	.stor_login_box{
		margin-top:300px;
		height:500px;
	}
	.stor_login_box #login_one{
		font-size:21px;
		font-weight:bold;
	}
	.stor_login_box #login_two{
		font-size:17px;
		color:gray;
		line-height:150%;
	}
	.stor_login_box #login_three{
		background:none;
		color:#ff8533;
		font-size:16px;
		border-color:#ff8533;
		border-width:1.5px;
		border-radius:20px;
		width:90px;
		height:35px;
	}
	.stor_login_box #login_three:hover{
		cursor:pointer;
	}
	.stor_login_box #login_three:focus{
		outline:none;
	}
	.container-fluid{
		padding-bottom:150px;
	}
	.stor_select{
		color:white;
	}

	.container{
		background:white;
		width: 100%;
		min-width: 955px;
		max-width: 1600px;
		height: 100%;
		margin:0 auto;
		display:flex;
	}
	.storage{
		width: 100%;
		min-width: 955px;
		max-width: 1600px;
		height: 100%;
	}
	#app{
		padding-bottom: 150px;
	}
	
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#login_three").on("click",function(){
			location.href="${path}/login.do";
		});
	});
	
</script>
</head>
<body>
	<div id="app">
	<%@ include file="../a01_main/header.jsp" %>
    <div class="container">
		<div class="storage"> 
                <div class="col" id="main-header">
                	<input type="button" class="genre-icons" value="내 리스트"></input>
                        <input type="button" class="genre-icons" value="♡ 곡"></input>
                        <input type="button" class="genre-icons" value="♡ 앨범" ></input>
                        <input type="button" class="genre-icons" value="♡ 가수" ></input>
                        <input type="button" class="genre-icons" value="많이 들은 곡"></input>
                        <input type="button" class="genre-icons" value="최근 들은 곡"></input>
                </div>
               
      			<div class="stor_login">
				<div class="stor_login_box">
					<span id="login_one">로그인해주세요.</span><br><br>
					<span id="login_two">로그인하시면 더욱 더 다양한<br>FLO를 즐길 수 있어요.</span><br><br>
					<button id="login_three">로그인</button>
				</div>
			</div>
          	</div>
       </div>
      <jsp:include page="../a01_main/footer.jsp"></jsp:include>
      </div>
    <jsp:include page="../a09_playList/musicplayer.jsp"></jsp:include>
</body>
</html>