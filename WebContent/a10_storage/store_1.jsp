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
	.mylist{
		margin-top:90px;
		width:1080px;
	}
	.stor_tab{
		width:100%;
	}
	.stor_tab tr{
		height:250px;
	}
	.stor_tab span{
		margin-left:10px;
	}
	.listname{
		font-size:14px;
		font-weight:600;
	}
	.listname:hover{
		color:blue;
		cursor:pointer;
	}
	.listcnt{
		font-size:12px;
	}
	.listdate{
		font-color:gray;
		font-size:12px;
	}
	.plus a{
		position:relative;
		font-size:12px;
		color:blue;
		top:45px;
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
	#plus_img{
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
					<li id="li_select"><a href="#" id="stor_select">내 리스트</a></li>
					<li><a href="store_2.jsp" class="stor_unselect">♡ 곡</a></li>
					<li><a href="store_3.jsp" class="stor_unselect">♡ 앨범</a></li>
					<li><a href="store_4.jsp" class="stor_unselect">♡ 가수</a></li>
					<li><a href="store_5.jsp" class="stor_unselect">많이 들은 곡</a></li>
					<li><a href="store_6.jsp" class="stor_unselect">최근 들은 곡</a></li>
				</ul>
			</div>
			<div class="mylist">
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
						<td><span class="listname">리스트1</span><br><br>
							<span class="listcnt">총 15곡</span><br>
							<span class="listdate">2021.03.01</span><br><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							</span></td>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/mylist_img02.jpg)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
							  <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
							</svg></button>
						</div></td>
						<td><span class="listname">리스트2</span><br><br>
							<span class="listcnt">총 7곡</span><br>
							<span class="listdate">2021.03.02</span><br><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							</span></td>
						<td><div class="stor_list_play" style="background-image:url(../z00_imgs/mylist_img03.jpg)">
							<input type="checkbox">
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
							  <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
							</svg></button>
						</div></td>
						<td><span class="listname">리스트3</span><br><br>
							<span class="listcnt">총 20곡</span><br>
							<span class="listdate">2021.03.03</span><br><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
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
						<td><span class="listname">리스트4</span><br><br>
							<span class="listcnt">총 17곡</span><br>
							<span class="listdate">2021.03.09</span><br><br><br>
							<span>
							<button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
							  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
							  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
							  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
							  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
							</svg></button>
							</span></td>					
						<td><img id="plus_img" src="../z00_imgs/mylist_plus_img.PNG"/></td>
						<td><span class="plus"><a href="#">새로운 리스트 만들기</a></span></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
<jsp:include page="../a01_main/footer.jsp"></jsp:include>
</body>
</html>