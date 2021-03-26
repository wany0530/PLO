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
<link rel="stylesheet" href="table.css">
<style>
 body{
    margin:0px; padding:0px; }
  /*페이지*/
 .page{
    display: flex;  flex-direction: column; }
 .wrapper{
    width:1400px; display: flex; height:2500px; background-color:white;  margin:0 auto; }  
.main_info{
	position : absolute; width : 600px; height : 100px; 
	margin-top : 175px; margin-left : 175px; }
.profile_box{
	width : 250px; height : 250px; border-radius: 5%;  overflow: hidden; border : 1px solid lightgray;
	position : absolute;  }
.profile_img{
	width: 100%;  height: 100%;  object-fit: cover;}
.playBtn_box{
	width : 58px; height : 58px;
	position : relative;  top : 190%; left : 30%; background-color : none;}
.playBtn{
	width: 0px; height: 0px; border-top: 13px solid transparent; border-bottom: 13px solid transparent; border-left: 21px solid #fff; border-right: none; 
	position : relative;  top : 25%; left : 50%;  }
.playBtn:hover{
	color : #FF8533;}	
.info_box{
	position : relative; left : 50%;	
	width : 300px; margin-bottom : 80px;}
.album_title{
	font-size : 25px; font-weight : bold; letter-spacing : -2px;  font-stretch : semi-condensed}
.album_title:hover{
	color : #FF8533;}
.artist_name{
	font-size : 17px; }	
.artist_name a{
	color: inherit;   text-decoration: none;}
.etc_info{
	margin-top : 20px;  }
.etc_info span{
	font-size : 15px; color : gray;}
.album_detail_btn button{
	background : #fff; border : none;}
#like_img1{
	width : 25px; height : 20px; position : relative; }
#like_img2{
	width : 25px; height : 20px; position : relative; }		
	
.btn_nav{
	position : absolute;   margin-top:180px;  margin-left : 90px; top : 330px; }
.btn_list{
    display:flex;}
.btn_list li{
    list-style-type:none;  padding:10px 20px; }   
.btn_list a{
    color:black; text-decoration:none;}
#li_select{
    background:#FF8533;  border-radius:20px}
#select{
    color:white;    font-weight:600;}
#select:hover{
    cursor:pointer;}   
.unselect:hover{
    cursor:pointer;    color:#FF8533;} 	

.album_info_intro{
	position : absolute; top : 500px;  margin-top : 100px;  margin-left : 100px; }
.album_info_intro dl{
	display: block; } 
.album_info_intro dt{
	display: block; float : left;   margin-left: 20px;  width : 80px; height : 40px;  font-weight : 700;}
.album_info_intro dd{
	margin-left : 15px; display: block; width : 700px; height : 40px; }  
.album_info{
	position : absolute; margin-left: 120px; top : 850px;  } 
.album_info_title{
	font-weight : 700; margin-bottom : 30px;}

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
   });
</script>
</head>
<body>
	
	<div class="page">
		<jsp:include page="../a01_main/header2.jsp"/> 
	  <div class="wrapper">
	    

	    <div class="main_info">
		   <div class="profile_box">
			   <img class="profile_img" src="${path}${album2.alb_img}">
			</div>
		   	<div class="playBtn_box">
		   		<div class="playBtn"></div>
		   	</div>
		   	<div class="info_box">
		   		<p class="album_title">${album2.alb_name}</p>
		   		<span class="artist_name"><a href="${path}/a04_artist/artistDetail_1.jsp">심규선 ></a></span>
		   		<p class="etc_info">		   			
		   			<span class="form">${album2.art_group}</span>&nbsp;&nbsp;|&nbsp;
		   			<span class="genre">${album2.genre_name}</span>
		   		</p>
		   		<div class="album_detail_btn">
			   		 <button type="button">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
	                       <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
	                       <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
	                       <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
	                       <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
	                    </svg>
	                 </button>
	                  <button type="button">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
	                       <path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
	                       <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
	                     </svg>	                     
	                 </button>
	                 <img id="like_img1" src="${path}/z00_imgs/like1.png">
					 <img id="like_img2" src="${path}/z00_imgs/like2.png">		
                 </div>		   				   				   	
			</div>
		</div>
							
			
		<div class="btn_nav">
			<form method="post">
		       <ul class="btn_list">
		           <li id="li_select"><a href="${path}/albumdetail2?alb_no=5" id="select">상세정보</a></li>
		           <li><a href="${path}/albumdetail?alb_no=5" id="unselect">수록곡</a></li>
		       </ul>
	       </form>
      	</div>

	     <div class="album_info_intro">
	     	<dl>
	     		<dt>앨범명</dt>
	     		<dd><span class="intro_album">${album2.alb_name}</span></dd>
	     		<dt>아티스트</dt>
	     		<dd><span class="intro_artist">${album2.art_name}</span></dd>
	     		<dt>발매사</dt>
	     		<dd><span class="intro_release">카카오엔터테인먼트</span></dd>
	     		<dt>기획사</dt>
	     		<dd><span class="intro_agency">헤아릴 규</span></dd>
	     	</dl>
	     </div>
	     <div class="album_info">
	     	<span class="album_info_title">앨범 소개</span>
	     	<div class="album_info_content">
	     		${album2.alb_intro}
	     	</div>
	     </div>
	   </div>
	   
	</div>
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
</script>
</html>