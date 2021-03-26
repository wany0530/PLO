// 재생목록 트랙 버튼
const $btn_add_mylist = $('<button type="button" class="btn_add_mylist">보관함에 추가하기</button>');
const $btn_playlist_more = $('<button type="buttton" class="btn_playlist_more">더보기</button>');
const $btn_list_listen = $('<button type="button" class="btn_list_listen">이 플레이리스트만 듣기</button>');
const $btn_list_close = $('<button type="button" class="btn_list_close">플레이리스트 열기</button>');
const $btn_delete = $('<button type="button" class="btn_delete">곡 삭제하기</button>');

// audioList, lasttrack으로 재생목록, 플레이어 화면 만들기
const $noList = $('<p class="no_list"><span>재생목록이</span>비어있습니다</p>');
const $notfount = $('<div class="notfount_txt"><div><em>재생목록에 담긴 곡이 없습니다.</em></div></div>');

// 더보기 관련 
const $dropdown_layer = '<div class="layer_dropdown layer_track_table_more"><ul><li><a href="#"><i class="ico_info_music"></i>곡정보</a>'
	+'</li><li><a href="#"><i class="ico_info_album"></i>앨범정보</a></li><li><a href="#"><i class="ico_info_artist"></i>아티스트정보</a>'
	+'</li><li><button type="button"><i class="ico_like"></i>좋아요</button></li></ul></div>';
// const $btn_playlist_more = $('<button type="buttton" class="btn_playlist_more">더보기</button>');
var listnum = -1;
$('.playlist_scroll').on('click', '.btn_playlist_more', function() {
	console.log('더보기 클릭~');
	$('.layer_dropdown').remove();
	if($(this).parent().parent().index()==listnum) {
		listnum=-1;
		return;
	}
	listnum = $(this).parent().parent().index();
	$(this).parent().append($dropdown_layer);
	$('.layer_dropdown a:first').attr('href', path+'/musicdetail?m_no='+audioList[listnum].m_no);
});


function makePlaylist(audiolist) {
	if(audioList==null) {
		$('.playlist_scroll').append($notfount);
		$('.playbar_ct .track_info').append($noList);
		return;
	} else {
		$('.playbar_ct .track_info').append('<p class="title">'+audioList[currentSong].m_name+'</p>');
		$('.playbar_ct .track_info').append('<p class="artist">'+audioList[currentSong].art_name+'</p>');
		$('.playbar_ct .track_area>.thumb').css('background-image', 'url("'+path+audioList[currentSong].m_path+'")');
		
		$('.playlist_scroll').append('<div class="playlist_section"><span></span></div>');
		for(var idx in audiolist) {
			var plCode = '<div id="PITEM_SINGLE_'+audiolist[idx].m_no+'_'+audiolist[idx].addedTime+'" class="playlist_item track_area">';
			plCode+='<div class="track_item">';
			plCode+='<a href="#" class="thumb"></a>';
			plCode+='<button type="button" class="btn_track_select">';
			plCode+='<div class="track_info">';
			plCode+='<p class="title"><span>'+audiolist[idx].m_name+'</span></p>';
			plCode+='<p class="artist">'+audiolist[idx].art_name+'</p>';
			plCode+='</div></button></div><div class="playlist_util"></div></div>';
			$('.playlist_section>span').append(plCode);
			$('#PITEM_SINGLE_'+audiolist[idx].m_no+'_'+audiolist[idx].addedTime+' .track_item>.thumb').css('background-image',
						'url("'+path+audiolist[idx].m_path+'")');
		}
		$('.playlist_item').eq(currentSong).addClass('pause');
		
		if(isLogin) {
			if(likeChk(audioList[currentSong].m_no)=='true') {
				$('.btn_like').data('proc', 'del');
				$('.btn_like').addClass('active');
			} else {
				$('.btn_like').data('proc', 'ins');
				$('.btn_like').removeClass('active');
			}
		}
	}
}
makePlaylist(audioList);

$('.track_area>.playlist_util').append($btn_add_mylist);
$('.track_area>.playlist_util').append($btn_playlist_more);
$('.group_area>.playlist_util').append($btn_list_listen);
$('.group_area>.playlist_util').append($btn_list_close);

// 재생목록 열고 닫기 
$('.btn_open_list').on('click', function(){
	$('.playlist_ct').toggle();
	$('.layer_dropdown').remove();
});
$('.btn_playlist_close').on('click', function(){
	$('.playlist_ct').hide();
	$('.layer_dropdown').remove();
});

// 리스트 열고 닫기
/*$('.btn_list_close').on('click', function(){
	$(this).closest('.group_area').toggleClass('open');
});*/
$('.playlist_util').on('click', '.btn_list_close', function() {
	$(this).closest('.group_area').toggleClass('open');
});
$('.btn_playlist').on('click', function(){
	if($(this).text()=='그룹열기') {
		$('.group_area').addClass('open');
		$(this).text('그룹접기');
		return;
	} 
	if($(this).text()=='그룹접기') {
		$('.group_area').removeClass('open');
		$(this).text('그룹열기');
		return;
	}
});

// 정렬... .. 안될듯...
/*$(".playlist_section").sortable({
	items: $(".playlist_item"),
	handle: $(".track_item").find("*")
});
$('.playlist_section').disableSelection();
$(".playlist_section").on('click', function(e){
	console.log(e);
});*/

// 오디오 재생
function playSong(n) {
	song.src=path+'/z03_music/'+audioList[n].m_no+".mp3";
	var playPromise = song.play();

	// In browsers that don’t yet support this functionality,
	// playPromise won’t be defined.
	if (playPromise !== undefined) {
	  playPromise.then(function() {
	    // Automatic playback started!
	  }).catch(function(error) {
	    // Automatic playback failed.
	    // Show a UI element to let the user manually start playback.
		$('.icon-player').removeClass('btn-player-pause');
		$('.icon-player').addClass('btn-player-play');
	  });
	}
	$('.track_area.pause').removeClass('pause');
	$('.track_area.now').removeClass('now');
	$('.playlist_item').eq(n).addClass('now');
	$('.icon-player').removeClass('btn-player-play');
	$('.icon-player').addClass('btn-player-pause');
	$('.playbar_ct .track_info').empty();
	$('.playbar_ct .track_info').append('<p class="title">'+audioList[n].m_name+'</p>');
	$('.playbar_ct .track_info').append('<p class="artist">'+audioList[n].art_name+'</p>');
	$('.playbar_ct .track_area>.thumb').css('background-image', 'url("'+path+audioList[n].m_path+'")');
	if(isLogin) {
		if(likeChk(audioList[currentSong].m_no)=='true') {
			$('.btn_like').data('proc', 'del');
			$('.btn_like').addClass('active');
		} else {
			$('.btn_like').data('proc', 'ins');
			$('.btn_like').removeClass('active');
		}
	}
	
	isAudioPlaying = true;
	sessionStorage.setItem('IS_PLAYING', isAudioPlaying);
	if(lasttrackList!=null) localLS = lasttrackList;
	localLS[u_no] = audioList[n];
	localStorage.setItem('PLO_LAST_TRACK', JSON.stringify(localLS));
}
// 다음곡재생
function nextPlay() {
	if($('[class^=btn-player-shuffle]').attr('class')=='btn-player-shuffle-active') {
		currentSong = Math.floor(Math.random()*audioList.length);
	} else {
		currentSong = (currentSong==maxSong) ? 0 : ++currentSong;
	}
	playSong(currentSong);
}

// 세션스토리지에 사용할 변수
var isPlaying = sessionStorage.getItem('IS_PLAYING');
var playTime = sessionStorage.getItem('PLAY_TIME');
var vol = sessionStorage.getItem('PLO_VOL');
console.log(isPlaying);
function playing(ele) {
	if(playTime!=null) song.currentTime = playTime;
	console.log(song.currentTime);
	if(vol!=null) song.volume = vol;
	if(ele=='false' || ele==null) return;
	song.play();
	$('.icon-player').removeClass('btn-player-play');
	$('.icon-player').addClass('btn-player-pause');
}
playing(isPlaying);


// 재생버튼
$('.icon-player').on('click', function(){
	if(audioList==null || audioList.length==0) return;
	$(this).toggleClass('btn-player-play');
	$(this).toggleClass('btn-player-pause');
	
	// play of pause
	if(song.paused) {
		song.play();
		isPlaying = true;
		sessionStorage.setItem('IS_PLAYING', isPlaying);
		if(lasttrackList!=null) localLS = lasttrackList;
		localLS[u_no] = audioList[currentSong];
		localStorage.setItem('PLO_LAST_TRACK', JSON.stringify(localLS));
		$('.track_area.pause').removeClass('pause').addClass('now');
		
	} else {
		song.pause();
		isPlaying = false;
		sessionStorage.setItem('IS_PLAYING', isPlaying);
		$('.track_area.now').removeClass('now').addClass('pause');
	}
});

// 다음곡버튼
$('.btn-player-next').on('click', function() {
	if(audioList==null || audioList.length==0) return;
	nextPlay();
});

// 이전곡버튼
$('.btn-player-previous').on('click', function() {
	if(audioList==null || audioList.length==0) return;
	if(song.currentTime>3) {
		song.currentTime=0;
		return;
	}
	currentSong = (currentSong==0) ? maxSong : --currentSong;
	playSong(currentSong);
});


// audio 관련 event
$(song).on('ended', function(){
	$('.track_area.now').removeClass('now');
	insPlaylog(audioList[currentSong].m_no);
	
	var currentRepeat = $('[class^=btn-player-repeat]').attr('class');
	if(currentRepeat=='btn-player-repeat1') {
		song.currentTime=0;
		return;
	}
	if($('[class^=btn-player-shuffle]').attr('class')=='btn-player-shuffle-active') {
		nextPlay();
		return;
	}
	if(currentRepeat=='btn-player-repeat-active') {
		nextPlay();
		return;
	}
	if(currentRepeat=='btn-player-repeat') {
		if(currentSong!=maxSong) {
			nextPlay();
		} else {
			$('.icon-player').toggleClass('btn-player-play');
			$('.icon-player').toggleClass('btn-player-pause');
		}
		return;
	}
});

function timeText(time) { //시간 text화하기
	var s = Math.floor(time % 60).toString();
	var m = Math.floor(time / 60).toString();
	return m.padStart(2, '0') + ':' + s.padStart(2,'0');
}
var noLoginTime = 60;
$(song).on('timeupdate', function(){
	if(!isLogin && song.currentTime>=noLoginTime) {
		$('.track_area.now').removeClass('now');
	
		var currentRepeat = $('[class^=btn-player-repeat]').attr('class');
		if(currentRepeat=='btn-player-repeat1') {
			song.currentTime=0;
			return;
		}
		if($('[class^=btn-player-shuffle]').attr('class')=='btn-player-shuffle-active') {
			nextPlay();
			return;
		}
		if(currentRepeat=='btn-player-repeat-active') {
			nextPlay();
			return;
		}
		if(currentRepeat=='btn-player-repeat') {
			if(currentSong!=maxSong) {
				nextPlay();
			} else {
				song.currentTime=0;
				song.pause();
				$('.icon-player').toggleClass('btn-player-play');
				$('.icon-player').toggleClass('btn-player-pause');
			}
			return;
		}
	}
	if(isLogin) {
		$('.playtime .progress').val(song.currentTime/song.duration * 100);
	} else {
		$('.playtime .progress').val(song.currentTime/noLoginTime * 100);
	}
	var rangeVal = $('.playtime .progress').val();
	$('.time_current').text(timeText(song.currentTime));
	$('.playtime .progress').css( 'background', 'linear-gradient(to right, #FF8533 0%, #FF8533 '+rangeVal+'%, #fff ' + rangeVal + '%, white 100%)' );
	sessionStorage.setItem('PLAY_TIME', song.currentTime);
});

$(song).on('durationchange', function() {
	if(!isLogin) {
		$('.time_all').text(timeText(noLoginTime));
		return;
	}
	$('.time_all').text(timeText(song.duration));
});

$(song).on('play', function() {
	if(!isLogin) {
		if($('.music_preview').length) return;
		makeloginSnack();
	}
})

// 화면에 스낵바 div 만들기
function makeSnack(snackTxt){
	var $snack_bar = $('<div class="snack_bar" style="z-index: 499;"><div class="txt_area"><p class="txt1"></p></div></div>');
	$('body').append($snack_bar);
	$('.txt1').text(snackTxt);
	var snackSet = setTimeout(function() {
		$('.snack_bar').remove();
		clearTimeout(snackSet);
	}, 3000);
}
function makeloginSnack() {
	var snackCode = '<div class="snack_bar snackbar_static music_preview"><div class="txt_area"><p class="txt1">1분 미리 듣기 중입니다.</p>'
				+ '<p class="txt2">로그인 하시고 전곡을 감상해보세요<a href="'+path+'/login.do">로그인</a></p>'
				+ '</div><button type="button">스낵바 닫기</button></div>';
	$('body').append(snackCode);
}
$('body').on('click', '.snack_bar button', function() {
	$('.music_preview').remove();
});

// 반복 재생 버튼
$('[class^=btn-player-repeat]').on('click', function() {
	var btnClass=$(this).attr('class');
	if(btnClass=='btn-player-repeat'){
		$(this).attr('class', 'btn-player-repeat-active');
		makeSnack('전제 음악을 반복합니다.');
		return;
	} 
	if(btnClass=='btn-player-repeat-active') {
		$(this).attr('class', 'btn-player-repeat1');
		makeSnack('현재 음악을 반복합니다.');
	}
	if(btnClass=='btn-player-repeat1') {
		$(this).attr('class','btn-player-repeat');
		makeSnack('반복을 사용하지 않습니다.');
	}
});

// 랜덤 재생 버튼
$('[class^=btn-player-shuffle]').on('click', function() {
	var btnClass=$(this).attr('class');
	if(btnClass=='btn-player-shuffle') {
		$(this).attr('class', 'btn-player-shuffle-active');
		makeSnack('재생목록을 랜덤으로 재생합니다.');
	} else {
		$(this).attr('class', 'btn-player-shuffle');
		makeSnack('재생목록을 순서대로 재생합니다.');
	}
});

// 볼륨 버튼, 볼륨조절
$('.btn_volume').on('click', function() {
	$(this).toggleClass('active');
	var vol = $('.volume_area .progress').val();
	$('.volume_handle').css('left', vol+'%');
	$('.volume_area .progress').css( 'background', 'linear-gradient(to right, #FF8533 0%, #FF8533 '+vol+'%, #fff ' + vol + '%, white 100%)' );
});
$('.volume_area .progress').on('input', function(){
	var vol = ($(this).val()*0.01).toFixed(2);
	song.volume = vol;
	if(vol==0) {
		$('.btn_volume').addClass('mute');
	} else {
		$('.btn_volume').removeClass('mute');
	}
	$('.volume_handle').css('left', vol*100+'%');
	$(this).css( 'background', 'linear-gradient(to right, #FF8533 0%, #FF8533 '+this.value +'%, #fff ' + this.value + '%, white 100%)' );
	sessionStorage.setItem('PLO_VOL', song.volume);
});


// 재생목록 트랙 클릭
// $('.btn_track_select').on('click', function(){
$('.playlist_scroll').on('click','.btn_track_select', function(){
	if($('.list_edit button:first').text()=='완료') return;
	currentSong = $(this).parent().parent().index();
	playSong(currentSong);
//	console.log("현재 트랙 번호:"+currentSong);
});

// 재생조절 바
// $('.playtime .progress').val(song.currentTime/song.duration * 100);
$('.playtime .progress').on('input', function() {
	if(audioList==null || audioList.length==0) return;
	song.currentTime = isLogin ? $(this).val()/100*song.duration : $(this).val()/100*noLoginTime;
	$(this).css( 'background', 'linear-gradient(to right, #FF8533 0%, #FF8533 '+this.value +'%, #fff ' + this.value + '%, white 100%)' );
});


// 편집 버튼
$('.list_edit button:first').on('click', function() {
	if($(this).text()=='편집') {
		$(this).text('완료');
		$('.playlist_util').empty();
		$('.playlist_util').append($btn_delete);
		$('.tit_playlist').text('재생목록편집');
		return;
	}
	if($(this).text()=='완료') {
		$(this).text('편집');
		$('.playlist_util').empty();
		$('.track_area>.playlist_util').append($btn_add_mylist);
		$('.track_area>.playlist_util').append($btn_playlist_more);
		$('.group_area>.playlist_util').append($btn_list_listen);
		$('.group_area>.playlist_util').append($btn_list_close);
		$('.tit_playlist').text('재생목록');
		return;
	}
});

// 삭제 버튼
$('.playlist_scroll').on('click', '.btn_delete', function() {
	var no = $(this).parent().parent().index();
	audioList.splice(no, 1);
	if(cookieAudioList!=null) localPL = cookieAudioList;
	localPL[u_no] = audioList;
	localStorage.setItem('PLO_PL', JSON.stringify(localPL));
	$(this).parent().parent().remove();
	maxSong--;
	console.log("삭제대상idx:"+no+", 현재재생idx:"+currentSong);
	if(audioList.length==0) {
		song.pause();
		currentSong=0;
		maxSong=0;
		
		$('.playbar_ct .track_info').empty();
		$('.playbar_ct .track_info').append($noList);
		$('.btn_like').removeClass('active');
		$('.playlist_scroll').empty();
		$('.playlist_scroll').append($notfount);
		$('.playbar_ct .track_area>.thumb').css('background-image', 'url("'+path+'/z00_imgs/music-player.svg")');
		$('.playtime .progress').val(0);
		$('.time_current').text('00:00');
		$('.time_all').text('00:00');
		$('.icon-player').toggleClass('btn-player-play');
		$('.icon-player').toggleClass('btn-player-pause');
		
		localStorage.removeItem('PLO_LAST_TRACK');
		sessionStorage.clear();
	} else {
		if(!song.paused){ // audioList 존재하고, 노래 재생중일 때
			if(currentSong>maxSong) {
				console.log("현재재생트랙이 맥스트랙보다 큽니다.");
				currentSong=0;
				playSong(currentSong);
				return;
			}
			if(currentSong==no) {
				playSong(no);
				return;
			}
		}
	}
});
function makeLoginPop() {
	var popupCode = '<div class="popup_container"><div class="popup_w common-alert"><div class="popup_content">'
		+ '<p class="popup_text align-left">로그인이 필요한 서비스입니다. 로그인하시겠습니까?</p></div><div class="popup_button_w">'
		+ '<button id="btnAlert0" type="button" class="btn_bg_white_s">취소</button>'
		+ '<button id="btnAlert1" type="button" class="btn_bg_orange_s">로그인</button></div></div></div>';
	$('.player_ct').after(popupCode);
}
// 좋아요 버튼
$('.btn_like').on('click', function() {
	if(!isLogin) {
		makeLoginPop(); 
		return;
	}
	likebtn($(this).data('proc'), audioList[currentSong].m_no);
});
$('body').on('click', '#btnAlert0', function() {
	$('.popup_container').remove();
});
$('body').on('click', '#btnAlert1', function() {
	location.href=path+'/login.do';
});

function insPlaylog(m_no) {
	$.ajax({
		url: path+'/playlog',
		type: 'GET',
		data: 'm_no=' +m_no,
		error: function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function likebtn(proc, m_no) {
	$.ajax({
		url: path + '/like',
		type: 'GET',
		data: 'proc='+proc+'&m_no='+m_no,
		success: function() {
			if(proc=='ins') {
				makeSnack('좋아요한 곡에 담겼습니다.');
				$('.btn_like').data('proc', 'del');
				$('.btn_like').toggleClass('active');
			}
			if(proc=='del') {
				makeSnack('좋아요한 곡이 취소되었습니다.');
				$('.btn_like').data('proc', 'ins');
				$('.btn_like').toggleClass('active');
			}
		},
		error: function(error){
			console.log(error);
		}
	});
}
function likeChk(m_no) { // 플레이어 좋아요 체크하기
	var rs = false;
	$.ajax({
		url: path + '/like',
		type: 'GET',
		data: 'proc=sel&m_no='+m_no,
		async: false,
		success: function(result) {
			console.log("결과:" + result);
			rs = result;
		},
		error: function(error) {
			console.log(error);
		}
	});
	console.log('rs:' + rs);
	return rs;
}
$('.playlist_scroll').on('click', '.layer_track_table_more button', function() {
	if(!isLogin) {
		makeLoginPop(); 
		return;
	}
});
function plusPlayList2(play, m_no) {
   $.ajax({
      url:path+'/musicdetail?p=p&m_no='+m_no,
      type:'get',
      dataType:'json',
      success:function(res){
         res.addedTime=Date.now();
         if(audioList!=null) {
            audioList.push(res);
            maxSong++;
            currentSong=maxSong;
         } else {
            audioList = [];
            audioList.push(res);
            currentSong=0;
            maxSong = 0;
            $('.playlist_scroll').empty();
            $('.playlist_scroll').append('<div class="playlist_section"><span></span></div>');
         }
         if(cookieAudioList!=null) localPL = cookieAudioList;
         localPL[u_no] = audioList;
         localStorage.setItem('PLO_PL', JSON.stringify(localPL)); // 비로그인 이면 0 , 로그인이면 id 번호예정..
         var plCode = '<div id="PITEM_SINGLE_'+res.m_no+'_'+res.addedTime+'" class="playlist_item track_area">';
         plCode+='<div data-no="'+res.m_no+'" class="track_item">';
         plCode+='<a href="#" class="thumb"></a>';
         plCode+='<button type="button" class="btn_track_select">';
         plCode+='<div class="track_info">';
         plCode+='<p class="title"><span>'+res.m_name+'</span></p>';
         plCode+='<p class="artist">'+res.art_name+'</p>';
         plCode+='</div></button></div><div class="playlist_util">';
         plCode+='<button type="button" class="btn_add_mylist">보관함에 추가하기</button>';
         plCode+='<button type="buttton" class="btn_playlist_more">더보기</button>';
         plCode+='</div></div>';
         $('.playlist_section>span').append(plCode);
         $('#PITEM_SINGLE_'+res.m_no+'_'+res.addedTime+' .track_item>.thumb').css('background-image',
               'url("'+path+res.m_path+'")');
         $('.list_edit button:first').text('편집');
         $('.playlist_util').empty();
         $('.track_area>.playlist_util').append($btn_add_mylist);
         $('.track_area>.playlist_util').append($btn_playlist_more);
         $('.group_area>.playlist_util').append($btn_list_listen);
         $('.group_area>.playlist_util').append($btn_list_close);
         $('.tit_playlist').text('재생목록');
         if(play) playSong(currentSong);
      },
      fail: function(){
         console.log('실패');
      }
   });
}
$('.chart-table').on('click', '.playmusic_btn', function() {
   plusPlayList2(true, $(this).data('mnum'));
});
$('.chart-table').on('click', '.plusmusic_btn', function() {
   plusPlayList2(false, $(this).data('mnum'));
   makeSnack('1곡이 재생목록에 담겼습니다.');
});
$('.music-check-box').on('click', '[name=mck_listen]', function() {
   plusPlayList2(true, $(this).data('mnum'));
});
$('.music-check-box').on('click', '[name=mck_playlist]', function() {
   plusPlayList2(false, $(this).data('mnum'));
   makeSnack('1곡이 재생목록에 담겼습니다.');
});
