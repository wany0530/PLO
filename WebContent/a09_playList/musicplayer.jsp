<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*" import="jspexp.z01_vo.*"
   import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/z01_css/musicplayer.css">
	<div class="playlist_ct" style="display:none;">
		<h3 class="tit_playlist">재생목록</h3>
		<div class="playlist_header_util">
			<ul class="player_util"></ul>
			<ul class="list_edit">
				<li><button type="button">편집</button></li>
				<li><button type="button" class="btn_playlist">그룹열기</button></li>
			</ul>
		</div>
		<div id="PITEM_SINGLE_WRAPPER" class="playlist_scroll">
		</div> <%--playlist_scroll --%>
		<button class="btn_playlist_close">재생목록 닫기</button>
	</div> <%--playlist_ct --%>
	
	<div class="player_ct">
		<section class="playbar_wrap">
			<div class="playbar_ct">
				<div class="track_area">
					<div class="thumb" style="background-image:url('${path}/z00_imgs/music-player.svg')"></div>
					<div class="track_info"></div>
				</div>
				<div class="player_controller">
					<div class="playtime">
						<%--max="100" --%>
						<input type="range" value="0" min="0" max="100" title="재생 시간 조절 바" class="progress"/>
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
<script>
	var isLogin = "${u.u_no}"=="" ? false : true;
	var u_no = isLogin ? "${u.u_no}" : "0";
	var path="${path}";
	console.log(isLogin + " : " + u_no);

 	// PlayList, Player에 사용할 변수
	var cookieAudioList = JSON.parse(localStorage.getItem('PLO_PL'));
	var lasttrackList = JSON.parse(localStorage.getItem('PLO_LAST_TRACK'));
	var lasttrack = lasttrackList == null ? 0 : lasttrackList[u_no];
	var audioList=null;
	var currentSong=null;
	var maxSong=null;
	var song = new Audio();
	var localPL = { };
	var localLS = { };
	// audioList 만들기
	function findCurrentSong(ele) {
		if(ele.m_no==lasttrack.m_no) return true;
	}
 	function setAudioList(arr) {
 		if(arr==null) return;
 		audioList = arr[u_no];
 		console.log(audioList==null);
 		if(audioList==null) return;
		// PL쿠키 있을 때
		currentSong = lasttrack==0 ? 0:audioList.findIndex(findCurrentSong);
		maxSong = audioList.length-1;
		song.src = path+'/z03_music/'+audioList[currentSong].m_no+".mp3";
 	}
 	setAudioList(cookieAudioList);
 	
 //	console.log(location.pathname);
 	var loc = location.pathname;
 	if(loc == '/plo/login.do') {
 		$('.playlist_ct .playlist_scroll').css('top', '220px');
 	}
</script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${path}/z02_js/musicplayer.js"></script>