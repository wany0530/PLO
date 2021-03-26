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

<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/z01_css/default.css">
<link rel="stylesheet" href="${path}/z01_css/chart.css">
<link rel="stylesheet" href="${path}/z01_css/music-check.css">
<link rel="stylesheet" href="${path}/z01_css/mylist-popup.css">
<link rel="stylesheet" href="${path}/z01_css/no-login-play.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<!-- jquery -->
<script src="${path}/z02_js/jquery-3.5.1.js"></script>

<style type="text/css" >
<c:forEach var="music" begin="1" end="${size }">
.more-content${music}{
  display:none;
  position: absolute;
  margin-top:40px;
  background-color: white;
  min-width: 200px;
  z-index: 1;
  padding: 10px 0px;
  box-shadow: 0px 0px 1px 3px whitesmoke;
  border-radius: 2px;
}

.more-content${music} a {
  text-align: left;
  display: block;
  color: black;
  padding: 12px 16px;
  font-size: 10pt;
  text-decoration: none;
  font-weight: bold;
}

.more-content${music} a:hover {
  background: whitesmoke;
  color: orange;
}

.more-content${music} a:hover .more-content-icons {
  color: rgba(0, 0, 0, 0.1);
}

.more-content${music} a .more-content-check {
  display: none;
}
.more-content${music} a:hover .more-content-check {
  display: inline;
}
</c:forEach>

</style>
<script type="text/javascript">
<%--
--%>
//
   $(document).ready(function(){
	   var cnt = 1;
	   var dcsize = "${size}";
	   var u_no = "${u_no}";
	   
	   <c:forEach var="music" begin="1" end="${size }">
		   if("${u_no}" == 0){
			   // 내 리스트 클릭시 비로그인 창
			   $("#mylist-modal${music}").on("click",function(){
			    	 $(".modal").css("display", "flex");
			   });
		   }else{
			   
			   //리스트명 만드는form은 일단 죽이고
			   if("${mylist}" == null){
				   $(".mylistInput-list").css("display","none");
			   }
				// 차트 폴더모양 클릭시 popup창 표시
				   $("#mylist-modal${music}").on("click",function(){
					   // 존재하는 내 리스트 목록 출력
				    	 $(".mylistInput").css("display", "flex");
					   // 보유하고있는 리스트를 클릭하면 해당노래와 해당리스트번호 전송.
				    	 $("[name=mylist_m_no]").val($(".m_no:eq(${music-1})").val());
				   });
		   	}   

		   
			// 더보기(icon) 각각 클릭시 보이기 안보이기		   
		   $("#mylist-more${music}").on("click",function(){
		     	 if(cnt == 1){
		     		$(".more-content${music}").css("display", "block");
		     		cnt++;
		     	 }else{
		     		$(".more-content${music}").css("display", "none");
		     		cnt = 1;
		     	 }
		    });
			
		   $("[name=playbutton${music}]").on("click",function(){
			   $("[name=playbuttonM_no]").val($(".m_no:eq(${music-1})").val());
		   		$("#playbuttonM_noF").submit();
		   });
		   $("[name=playlistbutton${music}]").on("click",function(){
			   $("[name=playlistbuttonM_no]").val($(".m_no:eq(${music-1})").val());
		   		$("#playlistbuttonM_noF").submit();
		   });
	   		$("#thisSongInfoB${music}").on("click",function(){
	   			$("#thisSongInfoF${music}").submit();
	   		})
	   		$("#thisAlbInfoB${music}").on("click",function(){
	   			$("#thisAlbInfoF${music}").submit();
	   		})
	   		$("#thisArtInfoB${music}").on("click",function(){
	   			$("#thisArtInfoF${music}").submit();
	   		})
	   		$("#thisHeartInfoB${music}").on("click",function(){
	   			if("${u_no}" == 0){
					$(".modal").css("display", "flex");
		 		
		 		}else{
					$("#thisHeartInfoF${music}").submit();
		 		}
	   		})
	   		
	      </c:forEach>
	  		// 듣기버튼 클릭시 하단 팝업
			if("${playbuttonM_no}" != "" || "${chkboxListen}" != ""){
				if(${u_no} == 0){
		    		  $(".xlogin-playboxadd-text2").css("display","none");
			    	  $(".no-login-play-box").css("display","none");
			    	  $(".xlogin-playboxadd-text").css("display","flex");
			    	  $(".no-login-play-box").css("display","flex");
			    	  setTimeout(function(){
			    		  $(".xlogin-playboxadd-text").css("display","none");
			    		  $(".xlogin-playboxadd-text2").css("display","flex");
					  }, 500);  
		    	  }else{
		    		  $(".xlogin-playboxadd-text").css("display","flex");
		        	  $(".xlogin-playboxadd-text2").css("display","none");
		        	  $(".no-login-play-box").css("display","flex");
		        	  setTimeout(function(){
		        		  $(".xlogin-playboxadd-text").css("display","none");
		        		  $(".no-login-play-box").css("display","none");
		    		  }, 500);
		    	  }
			}
			if("${playlistbuttonM_no}" != "" || "${chkboxListenlist}" != ""){
				  $(".xlogin-playboxadd-text").css("display","flex");
		    	  $(".xlogin-playboxadd-text2").css("display","none");
		    	  $(".no-login-play-box").css("display","flex");
		    	  setTimeout(function(){
		    		  $(".xlogin-playboxadd-text").css("display","none");
		    		  $(".no-login-play-box").css("display","none");
				  }, 500);
			}
		
	  		
		//check-box를 통한 내 리스트 부분
	      $(".music-check-items").eq(3).on("click",function(){
	    	  if(${u_no} == 0){
	    		 	 $(".modal").css("display", "flex");
	    		 	$(".mylistInput").css("display", "none");
	    	  }else{
	    		  $(".music-check-box").css("display","none");
				   $("#checkcnt").text(checkcnt);
				   $("#Pbox").prop("checked", false);
				$(".mylistInput").css("display", "flex");
				$("[name=mylist_m_no]").val($("input:checked").val());  
	    	  }
	  	  });
		
		   $(".title_image").on("click",function(){
			   $("title_image").val
		   });
		   
		   $(".genre-icons").on("click",function(){
				$("[name=genre_icons_value]").val($(this).index()-1);
				$("#genre-icon-form").submit();
			});
			 
			$("[name=art_name]").on("click",function(){
				$("[name=art_no]").submit();
			});
   });
   	var login = function(){
		location.href = "${path}/login.do";
	}
</script>
</head>
<body>
<div class="container-fluid" style="background: white;">
	   <jsp:include page="music-check.jsp"></jsp:include>
        <div class="row" style="height : 82px">
        	<%@ include file="../a01_main/header.jsp"%>
        </div>
        <div class="row" >
        <jsp:include page="mylist-popup.jsp"></jsp:include>
        <jsp:include page="no-login-play.jsp"></jsp:include>
            <div class="col-1"></div>
            <!-- 둘러보기 메인 -->
            <div class="col" id="tour">
                <!--장르 아이콘-->
                <div class="row">
                    <div class="col" id="main-header">
                    	<form id="genre-icon-form" method="get">
                    		<input type="hidden" name="genre_icons_value" value=""/>
                        	<input type="button" class="genre-icons" value="PLO차트" name="chartid"></input>
                        	<input type="button" class="genre-icons" value="지금 급상승 중" name="chartid"></input>
                        	<c:forEach var="g_list" items="${genre_list }">
                        		<input type="button" class="genre-icons" value="${g_list.genre_name }" name="chartid"></input>
                        	</c:forEach>
                        </form>
                    </div>
                </div>
                <!--메인 차트-->
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                <div class="row">
                    <div class="col" style="width:100px">
                        <!--차트 최상단-->
                        <div class="chart-title" style="padding:0px 15px">
                            <span style="font-size: 18pt; font-weight: bold;">PLO차트</span>
                            <span style="font-size: 10pt; padding-left: 5px;">업데이트 시간</span>
                            <input type="button" value="♪전체듣기" id="all_listen"/>
                        </div>
                        <div class="chart-table">
                            <table style="width: 100%;">
                                <thead>
                                    <tr>
                                        <td width="2%">
                                            <input type="checkbox" id="Pbox"/>
                                        </td>
                                        <td width="7%" class="tableheader">순위</td>
                                        <td width="51%" class="tableheader">곡/앨범</td>
                                        <td width="16%" class="tableheader">아티스트</td>
                                        <td width="6%">듣기</td>
                                        <td width="6%">재생목록</td>
                                        <td width="6%">내 리스트</td>
                                        <td width="6%">더보기</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="music" items="${listkind[chartcnt]}" varStatus="status">
                                     <div class="songinfo">
                                        <tr>
                                            <td width="2%" class="tableheaderchild">
                                            	<form>
                                                	<input type="checkbox" name="ckchild" value="${music.m_no}"></input>
                                                </form>
                                            </td>
                                            <td width="7%" class="tableheaderchild">${status.count}</td>
                                            <td width="51%" class="tableheaderchild">
                                            	<form method="get">
                                                	<input type="submit" class="title_image" style="background-image: url(${path}${music.alb_img })" name="alb_name" value="${music.alb_name }"></input>
                                                </form>
                                                <div class="title_album">
                                                	<form>
                                                    	<input type="hidden" name="m_no" class="m_no" value="${music.m_no}" ></input>
                                                    	<input type="submit" name="m_name" value="${music.m_name }" ></input>
                                                    </form>
                                                	<form>
                                                    	<input type="hidden" name="alb_no" value="${music.alb_no }" ></input>
                                                    	<input type="submit" name="alb_name" value="${music.alb_name }"></input>
                                                    </form>
                                                </div>
                                            </td>
                                            <td width="16%" class="tableheaderchild">
                                            	<form>
                                                	<input type="hidden" name="art_no" value="${music.art_no}"></input>
                                                	<input type="submit" name="art_name" value="${music.art_name }" style="background:none; border:none; font-weight:bold;"/>
                                                </form>
                                            </td>
                                            <td width="6%">                                           
                                                <button type="button" name="playbutton${status.count}" data-mnum="${music.m_no}" class="playmusic_btn">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
                                                        <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
                                                    </svg>
                                                </button>
                                            </td>
                                            <td width="6%">
                                           
                                                <button type="button" name="playlistbutton${status.count}" data-mnum="${music.m_no}" class="plusmusic_btn">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
                                                        <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
                                                        <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
                                                        <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
                                                        <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
                                                    </svg>
                                                </button>
                                                <div class="more-content${status.count}" name="more${status.count}">
                                                	<a id="thisSongInfoB${status.count}" href="${path}/musicdetail?m_no=${music.m_no}">
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
                                                	<a id="thisAlbInfoB${status.count}" href="${path}/albumdetail2?alb_no=${music.alb_no}">
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
                                                	<a id="thisArtInfoB${status.count}" href="${path}/musicdetail?art_no=${music.art_no}">
                                                        <svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-mic" viewBox="0 0 16 16">
                                                            <path fill-rule="evenodd" d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z"/>
                                                            <path fill-rule="evenodd" d="M10 8V3a2 2 0 1 0-4 0v5a2 2 0 1 0 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3z"/>
                                                        </svg>
                                                        <span style="margin-left: 5px;">아티스트정보</span>
                                                        <svg class="more-content-check" style="margin-left: 25%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                                                            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                                                        </svg>
                                                    </a>
                                                	<a id="thisHeartInfoB${status.count}">
                                                		<form id="thisHeartInfoF${status.count}">
                                                			<input type="hidden" name="thisHeartInfo" value="${music.m_no}"/>
                                                		</form>
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
                                                <button type="button" id="mylist-modal${status.count}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
                                                        <path d="M.5 3l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
                                                        <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
                                                    </svg>
                                                </button>
                                            </td>
                                            <td width="6%">
                                                <button type="button" id="mylist-more${status.count}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
                                                        <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                    </svg>
                                                </button>
                                            </td>
                                        </tr>
                                    </div>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr><td colspan="8">
                                        <input type="button" class="chart-more" value="더보기 ∨"></input>
                                    </td></tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                <!--장르들-->
                <div class="row">
                    <div class="col">
                        <!--장르 header-->
                        <h4 style="font-weight: bold; margin: 0px 15px 0px 15px;">장르</h4>
                        <!--장르 목록-->
                        <div class="genre-list">
                        	<c:forEach var="g_list" items="${genre_list }">
                        	
                        		<div class="genre-list-items" style="background-image: url(${path}/z00_imgs/genre_picture/${g_list.genre_code}.jpg);">
                        			<a href="${path}/genre.do?P_GENRE_code=${g_list.genre_code}" style="width:100%; height:100%; display:block;">
                                		<span>${g_list.genre_name }</span>
                                	</a>
                            	</div>
                            
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <!--기업소개-->
                <div class="row">
                    <div class="col">
                    	<%@ include file="../a01_main/footer.jsp"%>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        <div class="row">
                            <%@include file="../a09_playList/musicplayer.jsp" %>
        </div>
        <div class="modal">
            <div class="dialog">
                <div class="dialog-text">
                    <span>로그인이 필요한 서비스 입니다. 로그인 하시겠습니까??</span>
                </div>
                <div>
                    <button type="button" id="mylist-cancel">취소</button>
                    <button type="button" onclick="login()">로그인</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${path}/z02_js/chart.js"></script>
</html>