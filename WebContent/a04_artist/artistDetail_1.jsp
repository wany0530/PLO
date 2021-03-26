<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"
   import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="table.css">
<style>
 body{
    margin:0px; padding:0px; }
 a{
 	text-decoration:none;  color:black; color: inherit;}
 .page{
    display: flex;  flex-direction: column; }
 .wrapper{
    width:1400px; display: flex; height:1000px; background-color:white;  margin:0 auto; }  
 
.main_info{
	position : absolute; width : 600px; height : 100px; 
	margin-top : 80px; margin-left : 175px; }   
.profile_box{
	width : 250px; height : 250px; border-radius: 70%;  overflow: hidden; border : 1px solid lightgray;
	position : absolute;  }
.profile_img{
	width: 100%;  height: 100%;  object-fit: cover;}
.playBtn_box{
	width : 58px; height : 58px; border-radius: 70%;  border: 1px solid lightgray;
	position : relative;  top : 190%; left : 30%; background-color : #fff;}
.playBtn{
	width: 0px; height: 0px; border-top: 13px solid transparent; border-bottom: 13px solid transparent; border-left: 21px solid #000; border-right: none; 
	position : relative;  top : 25%; left : 35%; }
.playBtn:hover{
	color : #FF8533; cursor:pointer;}	
.info_box{
	position : relative; top : 18%;	left : 50%;	
	width : 300px; margin-bottom : 80px;}
.artist_name{
	font-size : 28px; font-weight : bold; letter-spacing : -2px;  font-stretch : semi-condensed}
.artist_name:hover{
	color : #FF8533; cursor:pointer;}
.etc_info{
	margin-top : 20px;  }
.info_like_container{
	width : 25px; height : 20px; position : relative; }
.info_like_container:hover{
	cursor:pointer; }		 
#like_img1{
	width : 100%; height : 100%; }
#like_img2{
	width : 100%; height : 100%;}
.famous_song{	
	position : absolute; top : 105px; left : 60px; width : 100px;
	font-size : 13px; font-weight : thin; letter-spacing : -1px;  font-stretch : semi-condensed}
.famous_song:hover{
	color : #FF8533; cursor:pointer;}
.famous_song a{
	color:black; text-decoration:none; }			
	
.btn_nav{
	position : absolute;   margin-top:130px; margin-left : 90px; top : 330px; }
.btn_list{
    display:flex;}
.btn_list li{
    list-style-type:none;  padding:10px 20px; }   
.btn_list a{
    color:black; text-decoration:none;}
#li_select{
    background:#FF8533;  border-radius:20px}
#select{
    color:#fff; font-weight:600;}
#select:hover{
    cursor:pointer;}   
#unselect:hover{
    cursor:pointer; color:#FF8533;} 	
.album_tab{
	border : none;}
.album_tab td{
	border : none;}
.up_tab{
	position : absolute;  top :  530px; width : 1200px; margin-left : 100px;}
.all_song{	
	position : absolute; width : 100px; 
	font-size : 13px; font-weight : thin; letter-spacing : -1px;  font-stretch : semi-condensed }
.all_song:hover{
	color : #FF8533; cursor:pointer;}
.all_song a{
	color:black; text-decoration:none; }	
.ordering{
	position : absolute; right : 0px; width : 200px; }
.ordering li{
	display:inline-block; float : right; list-style-type:none; padding:3px 3px; 
	font-size : 13px; font-weight : thin; letter-spacing : -1px;  font-stretch : semi-condensed }
.order_famous:hover, .order_recent:hover, .order_abc:hover{
	color : #FF8533; cursor:pointer;}	
.album_tab{
    position : absolute; top : 550px; margin-top:15px; width:1200px; text-align : left; margin-left : 100px;}
.album_tab tr{
    height:170px;  }
.album_tab span{
    margin-left:8px; }
.album_tab img{
    width:140px;  height:140px;  border-radius:10px;  }
.img_container{
	position : relative; }	
.album_play_btn{
	position : absolute; bottom : 15px;  right : 10px; width: 0px; height: 0px;   
	border-top: 11px solid transparent; border-bottom: 11px solid transparent; border-left: 18px solid #fff; border-right: none;}	
.album_play_btn:hover{
	cursor:pointer; color : #FF8533; }	
.album_name{
    font-size:15px;  font-weight:600; margin-buttom : 5px;  }
.album_name:hover{
   color : #FF8533;  cursor:pointer;  }
.artist{
	font-size:13px;  }
.artist:hover{
   color : #FF8533;  cursor:pointer; }
.release_type, .release_date{
   color:gray; font-size:12px;  }


</style>
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $("#like_img1").show();
      $("#like_img2").hide();
      
      $("#like_img1").click(function(){
    	  $("#like_img1").hide();
    	  $("#like_img2").show();
      })
       $("#like_img2").click(function(){
    	  $("#like_img2").hide();
    	  $("#like_img1").show();
      })
      
      $(".order_abc").css("color","#FF8533");
      $(".order_recent").click(function(){
    	  $(".order_recent").css("color","#FF8533");
    	  $(".order_abc").css("color","#000");
    	  $(".order_famous").css("color","#000");
      })
      $(".order_famous").click(function(){
    	  $(".order_famous").css("color","#FF8533");
    	  $(".order_abc").css("color","#000");
    	  $(".order_recent").css("color","#000");
      })
      $(".order_abc").click(function(){
    	  $(".order_abc").css("color","#FF8533");
    	  $(".order_recent").css("color","#000");
    	  $(".order_famous").css("color","#000");
      })
   });
</script>
</head>
<body>
	<div class="page">
		<%@ include file="../a01_main/header.jsp"%>
	  <div class="wrapper">

	    <div class="main_info">
		   <div class="profile_box">
			   <img class="profile_img" src="../z00_imgs/artist01.jpg">
			</div>
		   	<div class="playBtn_box">
		   		<div class="playBtn"></div>
		   	</div>
		   	<div class="info_box">
		   		<p class="artist_name">심규선 (Lucia)</p>
		   		<p class="etc_info">
		   			<span class="actForm">솔로</span>&nbsp;&nbsp;|&nbsp;
		   			<span class="gender">여성</span>&nbsp;&nbsp;|&nbsp;
		   			<span class="genre">발라드</span>
		   		</p>
		   		<div class="info_like_container">		   	
				   	<img id="like_img1" src="../z00_imgs/like1.png">
					<img id="like_img2" src="../z00_imgs/like2.png">		
				</div>
				<p class="famous_song"><a href="#">인기곡듣기</a></p>
			</div>
		</div>

		<div class="btn_nav">
	       <ul class="btn_list">
	           <li><a href="artistDetail_2.jsp" id="unselect">곡</a></li>
	           <li id="li_select"><a href="artistDetail_1.jsp" id="select">앨범</a></li>
	       </ul>
      	</div>
      	<div class="up_tab">
	      	<div class="all_song"><a href="#">전체듣기</a></div>
	      	<div class="ordering">
	      		<ul>
	      			<li class="order_famous">인기순</li>
	      			<li class="order_recent">최신순</li>
	      			<li class="order_abc">가나다순</li>
	      		</ul>
	      	</div>
      	</div>
      	
		<table class="album_tab">
            <col width="13%"><col width="20%"><col width="13%"><col width="20%"><col width="13%"><col width="20%">
               <tr>
                  <td><div class="img_container"><img src="../z00_imgs/albumArt1.jpg" />
                     <div class="album_play_btn"></div>
                  </div></td>
                  <td><span class="album_name"><a href="albumDetail_1.jsp">월령: 下</a></span><br>
                     <span class="artist"><a href="artistDetail_1.jsp">심규선 (Lucia)</a></span><br><br>
                     <span class="release_type">싱글</span><br>
                     <span class="release_date">2020.12.14</span><br><br>
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
						</svg> </button>
						<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
						<path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
						</svg></button>					
                     </span></td>
                  <td><div class="img_container"><img src="../z00_imgs/albumArt2.jpg" />
                     <div class="album_play_btn"></div>
                  </div></td>
                  <td><span class="album_name"><a href="albumDetail_1.jsp">월령: 上</a></span><br>
                     <span class="artist"><a href="artistDetail_1.jsp">심규선 (Lucia)</a></span><br><br>
                     <span class="release_type">싱글</span><br>
                     <span class="release_date">2020.11.22</span><br><br>
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
						</svg> </button>
						<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
						<path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
						</svg></button>
                     </span></td>
                  <td><div class="img_container"><img src="../z00_imgs/albumArt3.jpg" />
                     <div class="album_play_btn"></div>
                 </div></td>
                  <td><span class="album_name"><a href="albumDetail_1.jsp">내가 가장 예뻤을 때</a></span><br>
                     <span class="artist"><a href="artistDetail_1.jsp">심규선 (Lucia)</a></span><br><br>
                     <span class="release_type">OST</span><br>
                     <span class="release_date">2020.09.10</span><br><br>
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
						</svg> </button>
						<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
						<path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
						</svg></button>
                    </span></td>
               </tr>
            </table>
		</div>     

	   <div style="margin-left : 20px;">
	    <%@include file="../a01_main/footer.jsp" %></div>
	</div>
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
</script>
</html>