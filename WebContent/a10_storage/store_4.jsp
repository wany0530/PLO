<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../z01_css/default.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<style>
	.container{
		background:white;
		width:1080px;
		height:1000px;
		margin:0 auto;
		display:flex;
	}
	.storage-list{
		display:flex;
		margin-left:10px;
	}
	.storage-list li{
		list-style-type:none;
		padding:10px 20px;
		font-size:15px;
	}
	.storage-nav{
		margin-top:50px;
	}
	.storage-list a{
		color:black;
		text-decoration:none;
	}
	.likeAlbum{
		margin-top:90px;
		width:1080px;
		line-height:25px;
	}
	.stor_tab{
		width:100%;
	}
	.stor_tab tr{
		height:250px;
	}
	.listname{
		font-size:14px;
		font-weight:600;
	}
	.listname:hover{
		cursor:pointer;
		color:blue;
	}
	.listsArtist{
		font-size:12px;
	}
	.listdate{
		font-color:gray;
		font-size:12px;
	}
	.listalbum{
		font-size:12px;
	}
	.listganre{
		font-size:12px;
	}
	#stor_select{
		color:white;
		font-weight:600;
	}
	#stor_select:hover{
		cursor:pointer;
	}
	#li_select{
		background:blue;
		border-radius:20px;
	}
	.stor_unselect:hover{
		cursor:pointer;
		color:blue;
	}
	.stor_tab button{
		border: none;
		background: none;
		cursor:pointer;
	}
	.stor_tab button:focus{
		outline:0;
	}
	.stor_tab img{
		width:140px;
		height:140px;
		border-radius:10px;
	}
	.stor_tab .stor_list_play svg{
		position:relative;
		top:95px;
		left:90px;
		z-index:10;
		width:45px;
		height:45px;
		border-radius:70%;
		background:white;
	}
	.stor_tab .stor_list_play svg:hover{
		color:blue;
	}
	.stor_tab .stor_list_play{
		width:140px;
		height:140px;
		border-radius:70%;
		background-size:cover;
		background-position: center;
  		background-repeat: no-repeat;
  		cursor:pointer;
	}
	.like_heart svg{
		width:20px;
		height:20px;
		color:red;
	}
	.popular_play{
		font-size:14px;
		position:relative;
		bottom:5px;
	}
	.popular_play:hover{
		color:blue;
		cursor:pointer;
	}
	.stor_list_play [type=checkbox]{
		position:absolute;
		margin-top:5px;
		margin-left:5px;
		width:20px;
		height:20px;
		display:none;
	}
	.list_menu{
		position:block;
		height:30px;
	}
	.list_menu button{
		background:none;
		border:none;
		outline:none;
	}
	#right_p:hover{
		color:blue;
		cursor:pointer;
	}
	#right_p{
		float:right;
		font-size:13px;
	}
	#left_p{
		font-size:13px;
		display:none;
	}
	#left_p:hover{
		color:blue;
		cursor:pointer;
	}
	
</style>
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".listname").on("click",function(){
			  location.href="store_list_detail.jsp";
		});
		var check=0;
		$("#right_p").on("click",function(){
			if(check==0){
				$(this).text("완료");
				$("[type=checkbox]").css("display","inline-block");
				$("#left_p").css("display","inline-block");
				check=1;
			}else{
				$(this).text("편집");
				$("[type=checkbox]").css("display","none");
				$("#left_p").css("display","none");
				check=0;
			}
		});
		var allcheck=0;
		$("#left_p").on("click",function(){
			if(allcheck==0){
			  $(this).css("color","blue");
			  $("[type=checkbox]").prop("checked",true);
			  allcheck=1;
			}else{
			  $(this).css("color","black");
			  $("[type=checkbox]").prop("checked",false);
			  allcheck=0;
			}
		});
	});
</script>
</head>
<body>
<jsp:include page="../a01_main/header.jsp"></jsp:include>
	<div class="container">
		<div class="storage">
			<div class="storage-nav">
				<ul class="storage-list">
					<li><a href="store_1.jsp" class="stor_unselect">내 리스트</a></li>
					<li><a href="store_2.jsp" class="stor_unselect">♡ 곡</a></li>
					<li><a href="store_3.jsp" class="stor_unselect">♡ 앨범</a></li>
					<li id="li_select"><a href="#" id="stor_select">♥ 가수</a></li>
					<li><a href="store_5.jsp" class="stor_unselect">많이 들은 곡</a></li>
					<li><a href="store_6.jsp" class="stor_unselect">최근 들은 곡</a></li>
				</ul>
			</div>
			<div class="likeAlbum">
				<div class="list_menu"><button id="left_p">V 전체선택</button><button id="right_p">편집</button></div>
				<table class="stor_tab">
				<col width="17%"><col width="33%"><col width="17%"><col width="33%">
					<tr>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/store_singer2.PNG)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-circle" viewBox="0 0 16 16">
								  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								  <path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z"/>
								</svg></button>
						</div></td>
						<td><div class="album_list"><span class="listname">아이유</span><br>
							<span class="listsArtist">솔로</span> | <span class="listalbum">여성</span> | <span class="listganre">팝</span><br><br>
							<span>
							<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
								  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
								</svg></button>
							</span><span class="popular_play">&nbsp;&nbsp;▷ 인기곡 듣기</span></div></td>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/store_singer.jpg)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-circle" viewBox="0 0 16 16">
								  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								  <path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z"/>
								</svg></button>
						</div></td>
						<td><div class="album_list"><span class="listname">방탄소년단</span><br>
							<span class="listsArtist">그룹</span> | <span class="listalbum">남성</span> | <span class="listganre">힙합,랩,팝 랩</span><br><br>
							<span>
							<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
							  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg></button>
							</span><span class="popular_play">&nbsp;&nbsp;▷ 인기곡 듣기</span></div></td>
					</tr>
					<tr>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/store_singer3.PNG)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-circle" viewBox="0 0 16 16">
								  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								  <path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z"/>
								</svg></button>
						</div></td>
						<td><div class="album_list"><span class="listname">샤이니</span><br>
							<span class="listsArtist">그룹</span> | <span class="listalbum">남성</span> | <span class="listganre">팝</span><br><br>
							<span>
							<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
								  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
								</svg></button>
							</span><span class="popular_play">&nbsp;&nbsp;▷ 인기곡 듣기</span></div></td>
						<td></td><td></td>
					</tr>
				</table>
			</div>	
		</div>
	</div>
<jsp:include page="../a01_main/footer.jsp"></jsp:include>
</body>    	
</html>