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
		font-size:20px;
		font-weight:bold;
		color:#C6C6C6;
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
	.stor_select:hover, .stor_unselect:hover{
		cursor:pointer;
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
                	<input type="button" class="genre-icons stor_unselect" value="내 리스트" onclick="location.href='${path}/MyList.do'"></input>
                    <input type="button" class="genre-icons stor_unselect" value="♡ 곡" onclick="location.href='${path}/LikeArtist.do'"></input>
                    <input type="button" class="genre-icons stor_unselect" value="♡ 앨범" onclick="location.href='${path}/LikeAlbum.do'"></input>
                    <input type="button" class="genre-icons stor_select" style="background:orange" value="♡ 가수"></input>
                    <input type="button" class="genre-icons stor_unselect" value="많이 들은 곡" onclick="location.href='${path}/ManyMusicPlay.do'"></input>
                    <input type="button" class="genre-icons stor_unselect" value="최근 들은 곡" onclick="location.href='${path}/RecentMusicPlay.do'"></input>
                </div>
               
      			<div class="stor_login">
				<div class="stor_login_box">
					<span id="login_one">좋아요 한 가수가 없습니다.</span>
				</div>
			</div>
          	</div>
       </div>
			<%@ include file="../a01_main/footer.jsp" %>
      </div>
    <jsp:include page="../a09_playList/musicplayer.jsp"></jsp:include>
</body>
</html>