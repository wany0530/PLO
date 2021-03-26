 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<fmt:requestEncoding value="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plo</title>
<link rel="stylesheet" href="${path}/z01_css/default.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/z01_css/musicplayer.css">
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body> 
	<div class="playlist_ct" style="display:none;">
		<h3 class="tit_playlist">재생목록</h3>
		<div class="playlist_header_util">
			<ul class="player_util"></ul>
			<ul class="list_edit">
				<li>
					<button type="button">편집</button>
				</li>
				<li>
					<button type="button" class="btn_playlist">그룹열기</button>
				</li>
			</ul>
		</div>
		<div id="PITEM_SINGLE_WRAPPER" class="playlist_scroll">
<%--  재생목록에 곡 없을 때
			<div class="notfount_txt">
				<div>
					<em>재생목록에 담긴 곡이 없습니다.</em>
				</div>
			</div>
--%>
			<div class="playlist_section">
				<span>
					<%-- 리스트 --%>
					<div id="PITEM_SINGLE" class="playlist_item group_area"> <%-- class=" pause(닫기,정지) now(닫기,플레이) / open(열기) --%>
						<div groupid="" class="track_item">
							<button type="button" class="list_title">
								<span>리스트 이름</span>
							</button>
							<div class="list_track">
								<span>
									<%-- 곡 --%>
									<div id="PITEM_SINGLE" class="playlist_item track_area">
										<div class="track_item">
											<a href="#" class="thumb" style="background-image:url('../z00_imgs/track_thumb_img1.jpg')">
											</a>
											<button type="button" class="btn_track_select">
												<div class="track_info">
													<p class="title">
														<span style="--translateX-to: 0px; --animation-duration: 0s;">곡명이 길어집니다 계속계속 길어집니다 곡명이 언제까지 길어질까요</span>
													</p>
													<p class="artist">가수명</p>
												</div>
											</button>
										</div>	
										<div class="playlist_util">
										</div>
									</div> <%-- track_area --%>
								</span>
							</div>
						</div>
						<div class="playlist_util"></div>
					</div><%-- group_area --%>
					<div id="PITEM_SINGLE" class="playlist_item track_area">
						<div data-no="1" class="track_item">
							<a href="#" class="thumb" style="background-image:url('../z00_imgs/track_thumb_img1.jpg')">
							</a>
							<button type="button" class="btn_track_select">
								<div class="track_info">
									<p class="title">
										<span style="--translateX-to: 0px; --animation-duration: 0s;">Fly away(inst)</span>
									</p>
									<p class="artist">권진아</p>
								</div>
							</button>
						</div>	
						<div class="playlist_util">
						</div>
					</div>
					<div id="PITEM_SINGLE" class="playlist_item track_area">
						<div data-no="2" class="track_item">
							<a href="#" class="thumb" style="background-image:url('../z00_imgs/track_thumb_img1.jpg')">
							</a>
							<button type="button" class="btn_track_select">
								<div class="track_info">
									<p class="title">
										<span style="--translateX-to: 0px; --animation-duration: 0s;">내 손을 잡아(inst)</span>
									</p>
									<p class="artist">아이유(IU)</p>
								</div>
							</button>
						</div>	
						<div class="playlist_util">
						</div>
					</div>
					<div id="PITEM_SINGLE" class="playlist_item group_area"> 
						<div groupid="" class="track_item">
							<button type="button" class="list_title">
								<span>리스트 이름</span>
							</button>
							<div class="list_track">
								<span>
									<div id="PITEM_SINGLE" class="playlist_item track_area">
										<div class="track_item">
											<a href="#" class="thumb" style="background-image:url('../z00_imgs/track_thumb_img1.jpg')">
											</a>
											<button type="button" class="btn_track_select">
												<div class="track_info">
													<p class="title">
														<span style="--translateX-to: 0px; --animation-duration: 0s;">곡명</span>
													</p>
													<p class="artist">가수명</p>
												</div>
											</button>
										</div>	
										<div class="playlist_util">
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="playlist_util">
						</div>
					</div>
				</span>
			</div> <%--playlist_section --%>
		</div> <%--playlist_scroll --%>
		<button class="btn_playlist_close">재생목록 닫기</button>
	</div> <%--playlist_ct --%>
	
	<div class="player_ct">
		<section class="playbar_wrap">
			<div class="playbar_ct">
				<div class="track_area">
					<div class="thumb" style="background-image:url('${path}/z00_imgs/music-player.svg')"></div>
					<div class="track_info">
					<%-- 재생목록 없을 때 
						<p class="no_list">
							<span>재생목록이</span>비어있습니다
						</p>--%>
<%-- 					재생목록 있을 때--%>
						<p class="title">Fly away(inst)</p>
						<p class="artist">권진아</p> 
					</div>
				</div>
				<div class="player_controller">
					<div class="playtime">
						<%--max="100" --%>
						<input type="range" value="0" min="0" title="재생 시간 조절 바" class="progress"/>
						<span class="time_current">00:00</span>
						<span class="time_all">00:00</span>
					</div>
					<div class="control_area">
						<button type="button" class="btn-player-repeat">반복 재생 설정</button>
						<button type="button" class="btn-player-previous">이전 곡 재생하기</button>
						<button type="button" data-playing="false" class="icon-player btn-player-play"></button>
						<button type="button" class="btn-player-next">다음 곡 재생하기</button>
						<button type="button" class="btn-player-shuffle">곡 재생 방법 설정</button>
					</div>
					<div class="volume_area">
						<button type="button" class="btn_volume">볼륨 조절하기</button>
						<div class="progress_area">
							<div class="range_area">
								<input type="range" min="0" max="100" class="progress">
								<i class="volume_handle" style="left: 0%;"></i>
							</div>
						</div>
					</div>
					<div class="util_area">
						<button type="button" class="btn_like">좋아요</button>
						<button type="button" class="btn_open_list">재생 목록 열기</button>
						<%-- 누를 때 data-rake="{"state":"open"/"close"} --%>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%-- 스낵바
	<div class="snack_bar" style="z-index: 499;">
	
	</div>
	
	 --%>
	 <script>
	 	var isLogin = true;
	 	var path="${path}";
	 	var audioList = [{m_no:1, m_name:"Fly away(inst)", art_name:"권진아"}, 
			{m_no:2, m_name:"내 손을 잡아(inst)", art_name:"아이유(IU)"},
			{m_no:3, m_name:"그땐 그땐 그땐(inst)", art_name:"슈프림팀"}];
	 	var pl = {"0":audioList};
	 	localStorage.setItem('PLO_PL', JSON.stringify(pl));
	 </script>
	<script src="${path}/z02_js/musicplayer.js"></script>
 </body>
</html>