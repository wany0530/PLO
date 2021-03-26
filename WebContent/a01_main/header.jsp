<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- font Awesom -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<style>
#header { width: 100%; }
#header #header_inner { min-width: 955px; max-width: 1600px; margin: 0 auto; }
#header #header_inner #logo-box { display: inline-block; margin: 37px 10px 0 81px; position: relative; top: 6px; }
#header #header_inner #logo-box img { width: 56px; height: 25px; }

#header #header_inner #nav_group { display: inline-block;  vertical-align: center;}
#header #header_inner #nav_group li { display: inline-block; margin-left: 32px; }

#header #header_inner #searchBox { display: inline-block; margin-left: 45px; padding: 0 30px 0 38px;
	width: 280px; height: 32px; border: 1px solid #d2d2d2; border-radius: 17px; position: relative; top: -7px; }
#header #header_inner #searchBox button { position: absolute; left:13px; top: 6px; background: rgba(0,0,0,0); border: 1px solid white; }	
#header #header_inner #searchBox input { position: relative; top: 8px; border: none; width: 100%; }	

#header #header_inner #util_group { float: right; margin-top: 42px; margin-right: 70px;
	height: 40px; display: flex; justify-content: center;}
#header #header_inner #util_group ul { display: flex; justify-content: center; align-items: center;}
#header #header_inner #util_group li { margin-left: 30px; }
#header #header_inner #util_group #mypage-link { display: block; display: flex; align-items: center; }
#header #header_inner #util_group img { width: 40px; height: 40px; border-radius: 100%;
	position: relative; bottom: 3px; margin-left: 20px; }

</style>

<!-- header -->
<header id="header">

	<div id="header_inner">
		<div id="logo-box">
			<a href="${path}/a01_main/main.jsp" id="logo">
				<img src="${path}/z00_imgs/logo.png"/>
			</a>
		</div>
		<nav id="nav_group">
			<ul>
				<li><a href="${path}/chart.do">둘러보기</a></li>
				<li><a href="${path}/MyList.do">보관함</a></li>
			</ul>
		</nav>
		
		<div id="searchBox">
		<form method="get" action="${path}/ArtistSearch">
			<button>
				<i style="background: rgba(0,0,0,0);" class="fas fa-search search"></i>
			</button>
			<input style="background: rgba(0,0,0,0);" name="keyword" type="text" placeholder="검색어를 입력하세요.">
		</form>
		</div>
		
		
		<nav id="util_group">
			<ul>
				<c:if test="${u.u_id == 'admin'}">
				<li style="list-style: none;"><a href="${path}/admin">관리자</a></li>
				</c:if>
				<li style="list-style: none;"><a href="${path}/a01_main/intro.html" style="color:#8c8c8c;">PLO 소개</a></li>
				
				<c:if test="${!empty u.u_name}">	
					<li style="list-style: none;"><a href="${path}/mypage" id="mypage-link">
							<div>${u.u_name}</div>
							<img src="${path}/z00_imgs/artist01.jpg">
						</a>
					</li>
					<li style="list-style: none;"><a href="${path}/login.do">로그아웃</a></li>
				</c:if>
				<c:if test="${empty u.u_name}">
					<li style="list-style: none;"><a href="${path}/login.do" style="color:#8c8c8c;">로그인</a></li>
					<li style="list-style: none;"><a href="${path}/a03_login/signin_1.jsp" style="color:#8c8c8c;">회원가입</a></li>
				</c:if>
			</ul>
		</nav>
	</div>

</header>
