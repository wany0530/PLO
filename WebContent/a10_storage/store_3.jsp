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
		line-height:16px;
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
		color:blue;
		cursor:pointer;
	}
	.listsArtist{
		font-size:12px;
		cursor:pointer;
	}
	.listsArtist:hover{
		color:blue;
		cursor:pointer;
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
		top:105px;
		left:100px;
		z-index:10;
		width:30px;
		height:30px;
		color:white;
	}
	.stor_tab .stor_list_play svg:hover{
		color:blue;
	}
	.stor_tab .stor_list_play{
		width:140px;
		height:140px;
		border-radius:10px;
		background-size: cover;
		background-position: center;
  		background-repeat: no-repeat;
	}
	.like_heart svg{
		width:20px;
		height:20px;
		color:red;
	}
	.bi-music-note-list:hover{
		color:blue;
	}
	.bi-folder-plus:hover{
		color:blue;
	}
	.stor_list_play [type=checkbox]{
		position:absolute;
		margin-top:10px;
		margin-left:10px;
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
					<li id="li_select"><a href="#" id="stor_select">♥ 앨범</a></li>
					<li><a href="store_4.jsp" class="stor_unselect">♡ 가수</a></li>
					<li><a href="store_5.jsp" class="stor_unselect">많이 들은 곡</a></li>
					<li><a href="store_6.jsp" class="stor_unselect">최근 들은 곡</a></li>
				</ul>
			</div>
			<div class="likeAlbum">
				<div class="list_menu"><button id="left_p">V 전체선택</button><button id="right_p">편집</button></div>
				<table class="stor_tab">
				<col width="15%"><col width="18%"><col width="15%"><col width="18%"><col width="15%"><col width="18%">
					<tr>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/mylist_img01.jpg)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
							  <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
							</svg></button>
						</div></td>
						<td><span class="listname">Celebrity</span><br><br>
							<span class="listsArtist">아이유(IU)</span><br>
							<span class="listalbum">싱글</span> | <span class="listganre">댄스 팝</span><br>
							<span class="listdate">2021.01.27</span><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
							  <path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
							  <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
							</svg></button>
							<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
							  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg></button>
							</span></td>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/mylist_img02.jpg)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
							  <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
							</svg></button>
						</div></td>
						<td><span class="listname">Rollin'</span><br><br>
							<span class="listsArtist">브레이브걸스</span><br>
							<span class="listalbum">미니</span> | <span class="listganre">댄스 팝</span><br>
							<span class="listdate">2017.03.07</span><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
							  <path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
							  <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
							</svg></button>
							<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
							  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg></button>
							</span></td>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/mylist_img03.jpg)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
							  <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
							</svg></button>
						</div></td>
						<td><span class="listname">Dynamite</span><br><br>
							<span class="listsArtist">방탄소년단</span><br>
							<span class="listalbum">싱글</span> | <span class="listganre">댄스</span><br>
							<span class="listdate">2020.08.21</span><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
							  <path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
							  <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
							</svg></button>
							<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
							  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg></button>
							</span></td>
					</tr>
					<tr>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/mylist_img04.PNG)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
							  <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
							</svg></button>
						</div></td>
						<td><span class="listname">Don't call me</span><br><br>
							<span class="listsArtist">샤이니</span><br>
							<span class="listalbum">정규</span> | <span class="listganre">댄스</span><br>
							<span class="listdate">2021.02.21</span><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
							  <path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
							  <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
							</svg></button>
							<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
							  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg></button>
							</span></td>
							<td></td><td></td><td></td><td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../a01_main/footer.jsp"></jsp:include>
</body>
</html>