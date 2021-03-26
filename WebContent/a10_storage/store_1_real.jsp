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
	.storage-list a{
		color:black;
		text-decoration:none;
	}
	.mylist{
		margin-top:50px;
		width: 100%;
	}
	.stor_tab{
		width:1500px;/*수정*/
		margin-left:70px;/*수정*/
	}
	.stor_tab tr{
		height:280px;
	}
	.stor_tab span{
		margin-left:0px;/*수정*/
	}
	.listname{
		font-size:16px;
		font-weight:600;
	}
	.listname:hover{
		color:blue;
		cursor:pointer;
	}
	.listcnt{
		font-size:15px;
	}
	.listdate{
		font-color:gray;
		font-size:15px;
	}
	.plus{
		position:absolute;
		margin-top:80px;
		
	}
	.plus a{
		font-size:15px;
		color:blue;
		
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
		top:125px;
		left:120px;
		z-index:10;
		width:50px;
		height:50px;
		color:white;
	}
	.stor_tab .stor_list_play svg:hover{
		color:blue;
	}
	.stor_tab .stor_list_play{
		width:180px;
		height:180px;
		border-radius:10px;
		background-size: cover;
		background-position: center;
  		background-repeat: no-repeat;
	}
	.stor_tab .stor_list_play:hover{
		cursor:pointer;
		filter:brightness(60%);
	}
	.plus_img{
		position:absolute;
		cursor:pointer;
	}
	.bi-music-note-list:hover{
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
	.stor_unselect:hover, .stor_select:hover{
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
		<%--
		$(".listname").on("click",function(){
			var listname=$(this).text();
			location.href="${path}/MyListDetail.do?listname="+listname;
		});
		--%>
		$(".listname").on("click",function(){
			var idx=$(".listname").index(this);
			location.href="${path}/MyListDetail.do?idx="+idx;
		});
		$(".stor_list_play").on("click",function(){
			var idx=$(".stor_list_play").index(this);
			location.href="${path}/MyListDetail.do?idx="+idx;
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
	                   <input type="button" class="genre-icons stor_select" value="내 리스트"></input>
                        <input type="button" class="genre-icons stor_unselect" value="♡ 곡" onclick="location.href='${path}/LikeMusic.do'"></input>
                        <input type="button" class="genre-icons stor_unselect" value="♡ 앨범" onclick="location.href='${path}/LikeAlbum.do'"></input>
                        <input type="button" class="genre-icons stor_unselect" value="♡ 가수" onclick="location.href='${path}/LikeArtist.do'"></input>
                        <input type="button" class="genre-icons stor_unselect" value="많이 들은 곡" onclick="location.href='${path}/ManyMusicPlay.do'"></input>
                        <input type="button" class="genre-icons stor_unselect" value="최근 들은 곡" onclick="location.href='${path}/RecentMusicPlay.do'"></input>
                    </div>
                </div>
			</div>
			<div class="mylist">
				<div class="list_menu"><button id="left_p">V 전체선택</button><button id="right_p">편집</button></div>
				<table class="stor_tab">
				<col width="15%"><col width="18%"><col width="15%"><col width="18%"><col width="15%"><col width="19%">
					<c:set var="mylistsize" value="${mylist.size()}"/>
					<c:forEach var="m" items="${mylist}" varStatus="status">
						<c:if test="${status.count%3==1}">
							<tr>
						</c:if> 
						<td><div class="stor_list_play" style="background-image:url(${path}${mylist_imglist.get(status.index)})">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
							  <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
							</svg></button>
						</div></td>
						<td><span class="listname">${m.mylist_name}</span><br><br>
							<span class="listcnt">총 <span>${mcntlist.get(status.index)}</span>곡</span><br><br>
							<span class="listdate">${m.mylist_date}</span><br><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							</span></td>
							<c:choose>
								<c:when test="${mylistsize==1 and status.count%3==1}">
									<td><img class="plus_img" src="${path}/z00_imgs/mylist_plus_img.PNG"/></td>
									<td><span class="plus"><a href="#">새로운 리스트 만들기</a></span></td>
									<td></td><td></td>	
								</c:when>
								<c:when test="${mylistsize==2 and status.count%3==2}">
									<td><img class="plus_img" src="${path}/z00_imgs/mylist_plus_img.PNG"/></td>
									<td><span class="plus"><a href="#">새로운 리스트 만들기</a></span></td>
								</c:when>
								<c:when test="${mylistsize>3 and status.count%3==0}">
									<c:set var="mylistsize" value="${mylistsize-3}"/>
								</c:when>	
								<c:when test="${mylistsize==3 and status.count%3==0}">
									<tr>
									<td><img class="plus_img" src="${path}/z00_imgs/mylist_plus_img.PNG"/></td>
										<td><span class="plus"><a href="#">새로운 리스트 만들기</a></span></td>
										<td></td><td></td><td></td><td></td>
								</c:when>	
							</c:choose>
						<c:if test="${status.count%3==0}">
							</tr>
						</c:if> 
					</c:forEach>
					<c:if test="${empty mylist}">
						<tr>
							<td><img class="plus_img" src="${path}/z00_imgs/mylist_plus_img.PNG"/></td>
								<td><span class="plus"><a href="#">새로운 리스트 만들기</a></span></td>
								<td></td><td></td><td></td><td></td>
							</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
		<%@ include file="../a01_main/footer.jsp" %>
	</div>
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
</html>