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
<link rel="stylesheet" href="${path}/z01_css/chart.css">
<link rel="stylesheet" href="${path}/z01_css/music-check.css">
<link rel="stylesheet" href="${path}/z01_css/mylist-popup.css">
<link rel="stylesheet" href="${path}/z01_css/no-login-play.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>

<style type="text/css" >
<c:forEach var="music" begin="1" end="${size }">
.more-content${music}{
  display:none;
  position: absolute;
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
/*
input:focus{
border:none;
  outline: none;
}

a{    text-decoration:none;  color:black; color: inherit;}

.storage-list{
	display:flex;
	margin-left:-30px;
}

.storage-list li{
		list-style-type:none;
		padding:10px 20px;
		font-size:16px;
}

.storage-list a{
		color:black;
		text-decoration:none;
}
#stor_select{
		color:white;
		font-weight:600;
	}
	#stor_select:hover{
		cursor:pointer;
	}
	#li_select div{
		background:blue;
		height:40px;
		border-radius:20px;
	}
	.stor_unselect:hover{
		cursor:pointer;
		color:blue;
	}
*/


#main-header {
	display:flex;
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
a{    text-decoration:none;  color:black; color: inherit;}

	#stor_like_menu button{
		background:none;
		border:none;
		outline:none;
	}
	#stor_like_menu #allplay{
		margin-bottom:0px;
		font-size:13px;
	}
	#stor_like_menu #allplay:hover{
		color:blue;
		cursor:pointer;
	}
	.chart-title{
		margin-top:50px;
	}
	.stor_select{
		color:white;
	}
	
</style>
<script type="text/javascript">
<%--
--%>
//
   $(document).ready(function(){
      var cnt = 1;
      var dcsize = "${size}";
      // ?????????(icon) ?????? ????????? ????????? ????????????
      <c:forEach var="music" begin="1" end="${size}">
         $("#mylist-modal${music}").on("click",function(){
              $(".modal").css("display", "flex");
         });
         
         $("#mylist-more${music}").on("click",function(){
               if(cnt == 1){
                 $(".more-content${music}").css("display", "block");
                 cnt++;
               }else{
                 $(".more-content${music}").css("display", "none");
                 cnt = 1;
               }
          });
      </c:forEach>

      $("#mylist-cancel").on("click",function(){
         $(".modal").css("display", "none");
      })
      
      // ???????????? ????????? ?????? ??????
      $("[name=playbutton]").on("click",function(){
         $(".no-login-play-box").css("display","none");
         $(".xlogin-playboxadd-text").css("display","flex");
         $(".xlogin-playboxadd-text2").css("display","flex");
         $(".no-login-play-box").css("display","flex");
         setTimeout(function(){
            $(".xlogin-playboxadd-text").css("display","none");
        }, 500);
      });
      
      // ???????????? ????????? ?????? ?????? X ??????
      $(".xlogin-playboxs-close").on("click",function(){
         $(".no-login-play-box").css("display","none");
      })
      
      // ???????????? ????????? ?????? ??????
      $("[name=playlistbutton]").on("click",function(){
         $(".xlogin-playboxadd-text").css("display","flex");
         $(".xlogin-playboxadd-text2").css("display","none");
         $(".no-login-play-box").css("display","flex");
         setTimeout(function(){
            $(".xlogin-playboxadd-text").css("display","none");
            $(".no-login-play-box").css("display","none");
        }, 500);
      });
     // ????????????
     var isprod = true;
     var checkcnt = 0;
     // ???????????? ?????? ??????  (?????????)
      $("#Pbox").on("click", function(){
         if(isprod == true){
            $("[name=ckchild]").prop("checked", true);
            $(".music-check-box").css("display","flex");
            checkcnt = $("[name=ckchild]").length;
            $("#checkcnt").text(checkcnt);
            isprod=false;
         }else{
            $("[name=ckchild]").prop("checked", false);
            $(".music-check-box").css("display","none");
            checkcnt = 0;
            $("#checkcnt").text(checkcnt);
            isprod=true;
         }
      });
     // ???????????? ??????????????? (?????????)
     $("[name=ckchild]").on("click",function(){
        if($(this).prop("checked")){
           checkcnt++;
        }else{
           checkcnt--;
        }
       if(checkcnt != 0){
          $(".music-check-box").css("display","flex");
          $("#checkcnt").text(checkcnt);
       }else{
          $(".music-check-box").css("display","none");
       }
     })
     // ??????????????? ????????????
     $(".music-check-items").eq(0).on("click",function(){
           checkcnt = 0;
           $("[name=ckchild]").prop("checked", false);
           $(".music-check-box").css("display","none");
            $("#checkcnt").text(checkcnt);
            $("#Pbox").prop("checked", false);
        });
     $(".music-check-items").eq(1).on("click",function(){
        
     });
     $(".music-check-items").eq(2).on("click",function(){
        checkcnt = 0;
        $("[name=ckchild]").prop("checked", false);
        $(".music-check-box").css("display","none");
         $("#checkcnt").text(checkcnt);
         $("#Pbox").prop("checked", false);
     });
     $(".music-check-items").eq(3).on("click",function(){
        checkcnt = 0;
        $("[name=ckchild]").prop("checked", false);
        $(".music-check-box").css("display","none");
         $("#checkcnt").text(checkcnt);
         $("#Pbox").prop("checked", false);
     });
     
     
     
     

	   var allcheck=0;
	   $("#allplay").on("click",function(){
		   	if($(this).text()=="V ????????????"){
				if(allcheck==0){
					$("input[type=checkbox]").prop("checked",true);
					allcheck=1;
				}else{
					$("input[type=checkbox]").prop("checked",false);
					allcheck=0;
				}
		   	}
		});
	   $(".tableheader>input[type=checkbox]").on("click",function(){
			if(allcheck==0){
				$("input[type=checkbox]").prop("checked",true);
				allcheck=1;
			}else{
				$("input[type=checkbox]").prop("checked",false);
				allcheck=0;
			}
		});
   });
</script>
</head>
<body>
	<div class="container-fluid" style="background: white;">
      <jsp:include page="../a05_music/music-check.jsp"></jsp:include>
        <div class="row" style="height : 82px">
           <%@ include file="../a01_main/header.jsp" %>
        </div>
        <div class="row" >
        <jsp:include page="../a05_music/mylist-popup.jsp"></jsp:include>
        <jsp:include page="../a05_music/no-login-play.jsp"></jsp:include>
            <div class="col-1"></div>
            <!-- ???????????? ?????? -->
            <div class="col" id="tour">
                <!--?????? ?????????-->
                <div class="row">
                    <div class="col" id="main-header">
	                   <input type="button" class="genre-icons" value="??? ?????????" onclick="location.href='${path}/MyList.do'"></input>
                        <input type="button" class="genre-icons" value="??? ???" onclick="location.href='${path}/LikeMusic.do'"></input>
                        <input type="button" class="genre-icons" value="??? ??????" onclick="location.href='${path}/LikeAlbum.do'"></input>
                        <input type="button" class="genre-icons" value="??? ??????" onclick="location.href='${path}/LikeArtist.do'"></input>
                        <input type="button" class="genre-icons" value="?????? ?????? ???" onclick="location.href='${path}/ManyMusicPlay.do'"></input>
                        <input type="button" class="genre-icons stor_select" style="background:orange" value="?????? ?????? ???"></input>
                    </div>
                </div>
                <!--?????? ??????-->
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
                <div class="row">
                    <div class="col" style="width:100px">
                        <!--?????? ?????????-->
                        <div class="chart-title" style="padding:0px 15px">
                           <div id="stor_like_menu"><button id="allplay">??? ????????????</button></div>
                        </div>
                        <div class="chart-table">
                            <table style="width: 100%;">
                                <thead>
                                    <tr>
                                        <td width="2%">
                                            <input type="checkbox" id="Pbox"/>
                                        </td>
                                        <td width="1%" class="tableheader"></td>
                                        <td width="57%" class="tableheader">???/??????</td>
                                        <td width="16%" class="tableheader">????????????</td>
                                        <td width="6%">??????</td>
                                        <td width="6%">????????????</td>
                                        <td width="6%">??? ?????????</td>
                                        <td width="6%">?????????</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="music" items="${rminfolist}" varStatus="status">
                                     <div class="songinfo">
                                        <tr>
                                            <td width="2%" class="tableheaderchild">
                                                <input type="checkbox" name="ckchild" id="${music.m_name}"/>
                                            </td>
                                            <td width="1%" class="tableheaderchild"></td>
                                            <td width="57%" class="tableheaderchild">
                                                <div class="title_image" style="background-image: url(${path}${music.alb_img })"></div>
                                                <div class="title_album">
                                                    <span>${music.m_name }</span>
                                                    <span>${music.alb_name }&nbsp;&nbsp;&nbsp;&nbsp;???&nbsp;${mpcntlist.get(status.index)}</span>
                                                </div>
                                            </td>
                                            <td width="16%" class="tableheaderchild">${music.art_name }</td>
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
                                                <div class="more-content${status.count}" name="more${status.count}">
                                                   <a href="#">
                                                        <svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-music-note" viewBox="0 0 16 16">
                                                            <path d="M9 13c0 1.105-1.12 2-2.5 2S4 14.105 4 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
                                                            <path fill-rule="evenodd" d="M9 3v10H8V3h1z"/>
                                                            <path d="M8 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 13 2.22V4L8 5V2.82z"/>
                                                          </svg>
                                                        <span style="margin-left: 5px;">?????????</span>
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
                                                        <span style="margin-left: 5px;">????????????</span>
                                                        <svg class="more-content-check" style="margin-left: 42%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                                                            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                                                        </svg>
                                                    </a>
                                                   <a href="#">
                                                        <svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-mic" viewBox="0 0 16 16">
                                                            <path fill-rule="evenodd" d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z"/>
                                                            <path fill-rule="evenodd" d="M10 8V3a2 2 0 1 0-4 0v5a2 2 0 1 0 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3z"/>
                                                        </svg>
                                                        <span style="margin-left: 5px;">??????????????????</span>
                                                        <svg class="more-content-check" style="margin-left: 25%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                                                            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                                                        </svg>
                                                    </a>
                                                   <a href="#">
                                                        <svg class="more-content-icons" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
                                                            <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
                                                        </svg>
                                                        <span style="margin-left: 5px;">?????????</span>
                                                        <svg class="more-content-check" style="margin-left: 49%;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                                                            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                                                        </svg>
                                                    </a>
                                                </div>
                                            </td>
                                            <td width="6%">
                                                <button type="checkbox" id="mylist-modal${status.count}">
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
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
			<%@ include file="../a01_main/footer.jsp" %>
        </div>
        <div class="modal">
            <div class="dialog">
                <div class="dialog-text">
                    <span>???????????? ????????? ????????? ?????????. ????????? ????????????????????</span>
                </div>
                <div>
                    <button type="button" id="mylist-cancel">??????</button>
                    <button type="button">?????????</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../a09_playList/musicplayer.jsp"></jsp:include>
</body>
</html>