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
<link rel="stylesheet" href="${path}/z01_css/default.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<style>
#main-header {
  display: flex;
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

.genre-icons:focus {
  background: orange;
  color:white;
  outline:none;
}
.genre-icons:hover {
  border: 1px solid orange;
  color: gray;
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
	.storage-list{
		display:flex;
		margin-left:70px;/*수정*/
	}
	.storage-list li{
		list-style-type:none;
		padding:10px 20px;
		font-size:16px;/*수정*/
	}
	.storage-nav{
		margin-top:0px;
	}
	.likeAlbum{
		margin-top:50px;
		width:100%;/*수정*/
		line-height:25px;
	}
	.stor_tab{
		width:1500px;/*수정*/
		margin-left:70px;/*수정*/
	}
	.stor_tab tr{
		height:280px;
	}
	.listname{
		font-size:15px;
		font-weight:600;
	}
	.listname:hover{
		cursor:pointer;
		color:blue;
	}
	.listsArtist{
		font-size:14px;
	}
	.listalbum{
		font-size:14px;
	}
	.listganre{
		font-size:14px;
	}
	.stor_select{
		background:orange;
		color:white;
	}
	#stor_select:hover{
		cursor:pointer;
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
		width:180px;
		height:180px;
		border-radius:10px;
	}
	.stor_tab .stor_list_play svg{
		position:relative;
		top:115px;
		left:110px;
		z-index:10;
		width:60px;
		height:60px;
		border-radius:70%;
		background:white;
	}
	.stor_tab .stor_list_play svg:hover{
		color:blue;
	}
	.stor_tab .stor_list_play{
		width:180px;
		height:180px;
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
		height:50px;
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
		font-size:14px;
		margin-right:95px;
	}
	#left_p{
		font-size:14px;
		display:none;
		margin-left:70px;
	}
	#left_p:hover{
		color:blue;
		cursor:pointer;
	}
	#app{
		padding-bottom: 150px;
	}
	.stor_unselect:hover{
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
		$(".like_heart").on("click",function(){
			var idx=$(".like_heart").index(this);
			location.href="${path}/LikeArtist.do?idx="+idx;
		});
	});
</script>
</head>
<body>
<div id="app">
<%@ include file="../a01_main/header.jsp" %>
	<div class="container">
		<div class="storage">
			<div class="storage-nav">
				<div class="row">
                    <div class="col" id="main-header">
	                   <input type="button" class="genre-icons stor_unselect" value="내 리스트" onclick="location.href='${path}/MyList.do'"></input>
                        <input type="button" class="genre-icons stor_unselect" value="♡ 곡" onclick="location.href='${path}/LikeMusic.do'"></input>
                        <input type="button" class="genre-icons stor_unselect" value="♡ 앨범" onclick="location.href='${path}/LikeAlbum.do'"></input>
                        <input type="button" class="genre-icons stor_select" value="♡ 가수"></input>
                        <input type="button" class="genre-icons stor_unselect" value="많이 들은 곡" onclick="location.href='${path}/ManyMusicPlay.do'"></input>
                        <input type="button" class="genre-icons stor_unselect" value="최근 들은 곡" onclick="location.href='${path}/RecentMusicPlay.do'"></input>
                    </div>
                </div>
			</div>
			<div class="likeAlbum">
				<div class="list_menu"><button id="left_p">V 전체선택</button><button id="right_p">편집</button></div>
				<table class="stor_tab">
				<col width="15%"><col width="35%"><col width="15%"><col width="35%">
					<c:set var="artlist" value="${artslist.size()}"/>
					<c:forEach var="art" items="${artslist}" varStatus="status">
						<c:if test="${status.count%2==1}">
							<tr>
						</c:if>

							<td><div class="stor_list_play" style="background-image:url(${path}${art.art_img})">
								<input type="checkbox">
								<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-circle" viewBox="0 0 16 16">
									  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
									  <path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z"/>
									</svg></button>
							</div></td>
							<td><div class="album_list"><span class="listname">${art.art_name}</span><br>
								<span class="listsArtist">${art.art_group}</span> | <span class="listalbum">${art.art_gender}</span> | <span class="listganre">
									<c:forEach var="g" items="${glist.get(status.index)}" varStatus="sts">${g} </c:forEach>
									</span><br><br>
								<span>
								<button class="like_heart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
									  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
									</svg></button>
								</span><span class="popular_play">&nbsp;&nbsp;▷ 인기곡 듣기</span></div></td>
						<c:choose>
							<c:when test="${artlist==1 and status.count%2==1}">
								<td></td><td></td>	
							</c:when>
							<c:when test="${artlist>2 and status.count%2==0}">
								<c:set var="size" value="${artlist-2}"/>
							</c:when>		
						</c:choose>
						
						<c:if test="${status.count%3==0}">
							</tr>
						</c:if> 
					</c:forEach>
				</table>
			</div>	
		</div>
	</div>
<%@ include file="../a01_main/footer.jsp" %>
</div>
<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>    	
</html>