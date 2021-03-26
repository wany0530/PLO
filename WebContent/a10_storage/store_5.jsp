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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script></script>
<style>

     body{
      margin:0px;
      padding:0px;
     }
    
     /*페이지*/
      .page{
       display: flex;
       flex-direction: column;
       }
       
     /*전체 페이지*/
    .wrapper{
       width:1080px;
       height:100px;
       background-color:white; 
       margin:0 auto;
     }
    
     /*헤더*/
    .main_header {
       position: absolute;
       display: block;
       height:100px;
       width:1080px;
       }
     
     /*메인 로고*/  
     #main_logo{
       position:absolute;
     }
     
     /*메인 로고 이미지*/
     #main_logo img{
       width:90px;
       height:40px;
       margin-top:30px;
       }
       
      /*메뉴바*/ 
       #menubar{
       position:absolute;
       margin-top:30px;
       margin-left:100px;
       width:750px;
       height:30px;
       }
       
       /*메뉴바 검색 카테고리*/
       #menubar ul{
       display:inline-block;
       margin:0px;
       padding:0px;
       width:280px; /* 검색창 margin 수정 bootstrap 추가시 달라짐*/
        }
        
       /*메뉴바 검색 카테고리 상세*/
       #menubar ul li{
       display:inline-block;
       padding:10px 30px;    
       }
      
      /*메뉴바 검색 카테고리 상세*/ 
       #menubar ul li a{
       text-decoration:none;
       font-size:15px;
       font-weight:bold;
       color:black;
       }
       
       /*검색창*/
       #menubar #menu_search{
       display:inline-block;
       padding-left:0px;
       }
       
       /*검색창*/
       #menu_search input[type=text]{
       border:1px solid #FF8533;
       border-radius:5px;
       }
      
       /*검색 버튼*/ 
       #menu_search input[type=button]{
       border: 1px solid gray;
       border-radius:5px;
       background-color:#FF8533;
       color:white;
       border-color:#FF8533;
       }
       
       /*로그인 버튼*/
       #top_logjoin{
       position:absolute;
       display:inline-block;
       right:0px;
       top:30px;
       width:250px;
       }
      
       /*로그인*/ 
       #top_logjoin li{
       display:inline-block;
       list-style-type:none;
       padding:10px 10px;
       }
       
       /*회원가입*/
       #top_logjoin a{
       color:black;
       text-decoration:none;
       font-size:15px;
       font-weight: bold;
       }
       
       /*관리자*/
       .adminBtn{
       color:black;
       text-decoration:none;
       font-size:15px;
       font-weight: bold;     
       }
       
       
       
       
   
.footer{
   margin:0 auto; padding:0 auto; position : relative; height:310px; width:1080px; background:  #FFDAB9; 
    margin-top : 30px; font-size:15px;}
.footer a{
    text-decoration : none; color : #000;} 
 /*하단 사이트 정보 상세*/
.footer_site{   
    width:1080px; padding:40px; margin: 0 auto;  font-weight: bold;  }
/*하단 사이트 정보글 */
.content{
    width: 1080px; padding:10px; margin:10 auto;   margin-left : 30px;  line-height : 100%;  }

       
       
       
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
	.storage-list>li{
		list-style-type:none;
		padding:10px 20px;
		font-size:15px;
	}
	.storage-nav{
		margin-top:155px;
	}
	.storage-list>li>a{
		color:black;
		text-decoration:none;
	}
	.mylist{
		margin-top:30px;
		margin-left:50px;
		width:980px;
	}
	#stor_select{
		color:white;
		font-weight:600;
	}
	#stor_select:hover{
		cursor:pointer;
	}
	.stor_unselect:hover{
		color:blue;
		cursor:pointer;
	}
	#li_select{
		background:blue;
		border-radius:20px;
	}
	.chart-table{
		width:1080px;
		margin-top:90px;
	}
	#stor_like_menu #allplay{
		border: none;
		background: none;
		cursor:pointer;
		margin-bottom:15px;
		font-size:13px;
	}
	#stor_like_menu #allplay:focus{
		outline:0;
	}
	
	
	#tour {
  margin: 0 4em;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

#main-header {
  display: flex;
  padding: 35px 0;
}
.chart-title {
  margin-bottom: 20px;
}

#all_listen {
  float: right;
  background: rgba(0, 0, 0, 0);
  border: rgba(0, 0, 0, 0);
  font-size: 10pt;
  padding-top: 10px;
}
table {
  border-collapse: collapse;
  border-top: 1px solid lightgray;
  font-size: 10pt;
  font-weight: lighter;
  text-align: center;
}
table thead {
  color: gray;
}
tbody button {
  background: white;
  border: 1px solid rgba(0, 0, 0, 0);
}

th,
td {
  padding: 10px;
  border-bottom: 1px solid lightgray;
}
.a{
	padding:-8px 0px;
}

.tableheaderchild:nth-child(2) {
  display: flex;
  width: 100%;
}
.title_image{
	width: 60px;
	height:60px;
	border-radius:5px;
	background-repeat: no-repeat;
  	background-position: center;
  	background-size: 100%;
}
.title_album {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  margin-left:20px;
}

.tableheader,
.tableheaderchild {
  text-align: left;
  font-weight: bold;
}


.more-content {
  display: none;
  position: absolute;
  background-color: white;
  min-width: 200px;
  z-index: 1;  
  padding: 10px 0px;
  box-shadow: 0px 0px 1px 3px whitesmoke;
  border-radius:2px;
}

.more-content a {
  text-align: left;
  display: block;
  color: black;
  padding: 12px 16px;
  font-size: 10pt;
  text-decoration: none;
  font-weight: bold;
}

.more-content a:hover {
  background: whitesmoke;
  color: orange;
}

.more-content a:hover .more-content-icons {
  color: rgba(0, 0, 0, 0.1);
}

.more-content a .more-content-check {
  display: none;
}
.more-content a:hover .more-content-check {
  display: inline;
}
table tr{
  border-bottom: 1px solid lightgray;
}
</style>

<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	   var cnt = 1; 
	   
	   $(".mylist-more").on("click",function(){
	
	  	 if(cnt == 1){
	  		 $(".more-content").css("display", "block");
	  		 cnt++;
	  	 }else{
	  		$(".more-content").css("display", "none");
	  		cnt = 1;
	  	 }
	   });
	   // 듣기버튼 클릭시 하단 팝업
	   $("[name=playbutton]").on("click",function(){
	 	  $(".no-login-play-box").css("display","none");
	 	  $(".xlogin-playboxadd-text").css("display","flex");
	 	  $(".xlogin-playboxadd-text2").css("display","flex");
	 	  $(".no-login-play-box").css("display","flex");
	 	  setTimeout(function(){
	 		  $(".xlogin-playboxadd-text").css("display","none");
			  }, 500);
	   });
	   // 재생목록 클릭시 하단 팝업
	   $("[name=playlistbutton]").on("click",function(){
	 	  $(".xlogin-playboxadd-text").css("display","flex");
	 	  $(".xlogin-playboxadd-text2").css("display","none");
	 	  $(".no-login-play-box").css("display","flex");
	 	  setTimeout(function(){
	 		  $(".xlogin-playboxadd-text").css("display","none");
	 		  $(".no-login-play-box").css("display","none");
			  }, 500);
	   });
	   //음원 체크박스
	   $(".music-check-box").css("display","none");
	   // 리스트담기 팝업
	   $(".mylistInput").css("display","none");
	   // 재생시 하단 팝업
	   $(".no-login-play-box").css("display","none");
	   
	});
</script>
</head>
<body>
	<jsp:include page="../a05_music/music-check.jsp"></jsp:include>
	<jsp:include page="../a05_music/mylist-popup.jsp"></jsp:include>
	<jsp:include page="../a05_music/no-login-play.jsp"></jsp:include>
 <div class="page">
  <div class="wrapper">
    <div class="main_header">
      <div id="main_logo">
       <a href="#"><img src="../z00_imgs/logo.png"></a>
      </div>
     
     <nav id="menubar">
       <ul>
        <li><a href="#">둘러보기</a></li>
        <li><a href="#">보관함</a></li>
       </ul>
      <form id="menu_search">
       <input type="text" placeholder="검색어를 입력하세요" size="50px">
       <a href="#"><input type="button" value="검색" size="10px"></a>   
      </form>
     </nav> 
   
      
      
       <ul id="top_logjoin">
       <li><c:if test="${m.u_name == 'admin'}">
		<div id="adminBtn">
			<a href="#">관리자</a>
		</div>
		</c:if>
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
      </ul>
    </div> 
	<div class="container">
		<div class="storage">
			<div class="storage-nav">
				<ul class="storage-list">
					<li><a href="store_1.jsp" class="stor_unselect">내 리스트</a></li>
					<li><a href="store_2.jsp" class="stor_unselect">♡ 곡</a></li>
					<li><a href="store_3.jsp" class="stor_unselect">♡ 앨범</a></li>
					<li><a href="store_4.jsp" class="stor_unselect">♡ 가수</a></li>
					<li id="li_select"><a href="#" id="stor_select">많이 들은 곡</a></li>
					<li><a href="store_6.jsp" class="stor_unselect">최근 들은 곡</a></li>
				</ul>
			</div>
					<div class="chart-table">
			        <div id="stor_like_menu"><button id="allplay">▷ 전체듣기</button></div>
			        <table style="width: 100%;">
			            <thead>
			                <tr>
			                    <td width="2%">
			                        <input type="checkbox"/>
			                    </td>
			                    <td width="50%" class="tableheader">곡/앨범</td>
			                    <td width="16%" class="tableheader">아티스트</td>
			                    <td width="8%" class="tab_h2">듣기</td>
			                    <td width="8%" class="tab_h2">재생목록</td>
			                    <td width="8%" class="tab_h2">내 리스트</td>
			                    <td width="8%" class="tab_h2">더보기</td>
			                </tr>
			            </thead>
			            <tbody>
							<div class="songinfo">
			                	<tr>
			                    	<td width="2%" class="tableheaderchild">
			                            <input type="checkbox"/>
			                        </td>
			                        <td width="58%" class="tableheaderchild">
			                            	<div class="title_image" style="background-image: url(../z00_imgs/mylist_img02.jpg);"></div>
			                                <div class="title_album">
			                                    <span>롤린(Rollin)</span>
			                                    <span>Rollin'</span>
			                               	</div>
			                           	</td>
			                           	<td width="16%" class="tableheaderchild">브레이브 걸스</td>
			                          	<td width="6%">
			                             	<button type="button" name="playbutton">
			                               		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
			                                    	<path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
			                                    </svg>
			                           		</button>
			                   			</td>
			                            <td width="6%">
			                			<button type="button"  name="playlistbutton">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
			                                <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
			                                <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
			                             	<path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
			                                <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
			                                </svg>
			                            </button>
			                           	<div class="more-content">
			                            	<a href="#">
			                                	<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-music-note" viewBox="0 0 16 16">
			                                 	<path d="M9 13c0 1.105-1.12 2-2.5 2S4 14.105 4 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
			                                  	<path fill-rule="evenodd" d="M9 3v10H8V3h1z"/>
			                                  	<path d="M8 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 13 2.22V4L8 5V2.82z"/>
			                                   	</svg>
			                                    <span style="margin-left: 5px;">곡정보</span>
			                                    <svg class="more-content-check" style="margin-left: 50%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                   	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                             	</a>
			                               	<a href="#">
			                                    <svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
			                            		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			                                  	<path d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z"/>
			                             	    <path d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			                					</svg>
			                                    <span style="margin-left: 5px;">앨범정보</span>
			                                   	<svg class="more-content-check" style="margin-left: 42%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                              	</a>
			                               	<a href="#">
			                                	<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-mic" viewBox="0 0 16 16">
			                                  	<path fill-rule="evenodd" d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z"/>
			                                    <path fill-rule="evenodd" d="M10 8V3a2 2 0 1 0-4 0v5a2 2 0 1 0 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3z"/>
			                                    </svg>
			                                    <span style="margin-left: 5px;">아티스트정보</span>
			                                    <svg class="more-content-check" style="margin-left: 25%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                   	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                            	</a>
			                               	<a href="#">
			                		 			<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
			                                   	<path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
			                               		</svg>
			                        			<span style="margin-left: 5px;">좋아요</span>
			                        			<svg class="more-content-check" style="margin-left: 49%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
				                          	 	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
				                	 			</svg>
			                             	</a>
			                           	</div>
			                       	</td>
			                       	<td width="6%">
			                      		<button type="checkbox" class="mylist-modal">
			                           		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
			                               	<path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
			                             	<path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
			                            	</svg>
			                         	</button>
			                        </td>
			                       	<td width="6%">
			                        	<button type="button" class="mylist-more">
			                            	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
			                            	<path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
			                              	</svg>
			                      		</button>
			                   		</td>
			           			</tr>
			          		</div>
							<div class="songinfo">
			                	<tr>
			                    	<td width="2%" class="tableheaderchild">
			                            <input type="checkbox"/>
			                        </td>
			                       <td width="58%" class="tableheaderchild">
			                            	<div class="title_image" style="background-image: url(../z00_imgs/mylist_img03.jpg);"></div>
			                                <div class="title_album">
			                                    <span>Dynamite</span>
			                                    <span>Dynamite(DayTime Version)</span>
			                               	</div>
			                           	</td>
			                           	<td width="16%" class="tableheaderchild">방탄소년단</td>
			                          	<td width="6%">
			                             	<button type="button" name="playbutton">
			                               		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
			                                    	<path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
			                                    </svg>
			                           		</button>
			                   			</td>
			                            <td width="6%">
			                			<button type="button" name="playlistbutton">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
			                                <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
			                                <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
			                             	<path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
			                                <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
			                                </svg>
			                            </button>
			                           	<div class="more-content">
			                            	<a href="#">
			                                	<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-music-note" viewBox="0 0 16 16">
			                                 	<path d="M9 13c0 1.105-1.12 2-2.5 2S4 14.105 4 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
			                                  	<path fill-rule="evenodd" d="M9 3v10H8V3h1z"/>
			                                  	<path d="M8 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 13 2.22V4L8 5V2.82z"/>
			                                   	</svg>
			                                    <span style="margin-left: 5px;">곡정보</span>
			                                    <svg class="more-content-check" style="margin-left: 50%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                   	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                             	</a>
			                               	<a href="#">
			                                    <svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
			                            		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			                                  	<path d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z"/>
			                             	    <path d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			                					</svg>
			                                    <span style="margin-left: 5px;">앨범정보</span>
			                                   	<svg class="more-content-check" style="margin-left: 42%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                              	</a>
			                               	<a href="#">
			                                	<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-mic" viewBox="0 0 16 16">
			                                  	<path fill-rule="evenodd" d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z"/>
			                                    <path fill-rule="evenodd" d="M10 8V3a2 2 0 1 0-4 0v5a2 2 0 1 0 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3z"/>
			                                    </svg>
			                                    <span style="margin-left: 5px;">아티스트정보</span>
			                                    <svg class="more-content-check" style="margin-left: 25%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                   	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                            	</a>
			                               	<a href="#">
			                		 			<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
			                                   	<path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
			                               		</svg>
			                        			<span style="margin-left: 5px;">좋아요</span>
			                        			<svg class="more-content-check" style="margin-left: 49%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
				                          	 	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
				                	 			</svg>
			                             	</a>
			                           	</div>
			                       	</td>
			                       	<td width="6%">
			                      		<button type="checkbox" class="mylist-modal">
			                           		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
			                               	<path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
			                             	<path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
			                            	</svg>
			                         	</button>
			                        </td>
			                       	<td width="6%">
			                        	<button type="button" class="mylist-more">
			                            	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
			                            	<path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
			                              	</svg>
			                      		</button>
			                   		</td>
			           			</tr>
			          		</div>
			          		<div class="songinfo">
			                	<tr>
			                    	<td width="2%" class="tableheaderchild">
			                            <input type="checkbox"/>
			                        </td>
			                        <td width="58%" class="tableheaderchild">
			                            	<div class="title_image" style="background-image: url(../z00_imgs/mylist_img01.jpg);"></div>
			                                <div class="title_album">
			                                    <span>Celebrity</span>
			                                    <span>Celebrity</span>
			                               	</div>
			                           	</td>
			                           	<td width="16%" class="tableheaderchild">아이유</td>
			                          	<td width="6%">
			                             	<button type="button"  name="playbutton">
			                               		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
			                                    	<path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
			                                    </svg>
			                           		</button>
			                   			</td>
			                            <td width="6%">
			                			<button type="button"  name="playlistbutton">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
			                                <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
			                                <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
			                             	<path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
			                                <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
			                                </svg>
			                            </button>
			                           	<div class="more-content">
			                            	<a href="#">
			                                	<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-music-note" viewBox="0 0 16 16">
			                                 	<path d="M9 13c0 1.105-1.12 2-2.5 2S4 14.105 4 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
			                                  	<path fill-rule="evenodd" d="M9 3v10H8V3h1z"/>
			                                  	<path d="M8 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 13 2.22V4L8 5V2.82z"/>
			                                   	</svg>
			                                    <span style="margin-left: 5px;">곡정보</span>
			                                    <svg class="more-content-check" style="margin-left: 50%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                   	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                             	</a>
			                               	<a href="#">
			                                    <svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
			                            		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			                                  	<path d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z"/>
			                             	    <path d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			                					</svg>
			                                    <span style="margin-left: 5px;">앨범정보</span>
			                                   	<svg class="more-content-check" style="margin-left: 42%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                              	</a>
			                               	<a href="#">
			                                	<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-mic" viewBox="0 0 16 16">
			                                  	<path fill-rule="evenodd" d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z"/>
			                                    <path fill-rule="evenodd" d="M10 8V3a2 2 0 1 0-4 0v5a2 2 0 1 0 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3z"/>
			                                    </svg>
			                                    <span style="margin-left: 5px;">아티스트정보</span>
			                                    <svg class="more-content-check" style="margin-left: 25%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
			                                   	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
			                                    </svg>
			                            	</a>
			                               	<a href="#">
			                		 			<svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
			                                   	<path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
			                               		</svg>
			                        			<span style="margin-left: 5px;">좋아요</span>
			                        			<svg class="more-content-check" style="margin-left: 49%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
				                          	 	<path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
				                	 			</svg>
			                             	</a>
			                           	</div>
			                       	</td>
			                       	<td width="6%">
			                      		<button type="checkbox" class="mylist-modal">
			                           		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
			                               	<path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
			                             	<path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
			                            	</svg>
			                         	</button>
			                        </td>
			                       	<td width="6%">
			                        	<button type="button" class="mylist-more">
			                            	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
			                            	<path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
			                              	</svg>
			                      		</button>
			                   		</td>
			           			</tr>
			          		</div>
			 			</tbody>
			        </table>
			    	</div>
				</div>
			</div>
			<div class="footer">
				<div class="footer_site">
			    	<a href="">공지사항 | </a>
			     	<a href="">고객센터 |</a>
			    	<a href="">PLO 플레이어 다운로드  </a>
			 
			 		<br><br>
			
			     	<a href="">회사소개 |</a>
			   	  	<a href="">이용약관 |</a>
			   	  	<a href="">개인정보 처리방침 |</a> 
			     	<a href="">청소년 보호정책 |</a> 
			     	<a href="">사업자 정보 확인 </a>
			    </div>
			 
			    <div class="content">
			     대표이사 : 김김김  <br><br>
			     이메일 : plo@music-plo.com | &nbsp 사업자 등록번호 : 134-57-14646 |
			     &nbsp 통신판매업 신고번호 : 2021-서울역삼-1331<br><br>
			    주소 및 대표번호 플로하우스 : 서울특별시 서초구 강남대로 대표전화: 1341-3141<br><br>
			    아이리버 : 서울특별시 서초구 역삼동 &nbsp 대표전화: 1931-2492
			    (주)플로1조컴퍼니
			    <br><br>
			    ALL RIGHTS RESERVED
			  	</div>
			</div>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>