function plusPlayList(play) {
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
$('.btn_thumbnail_play').on('click', function() {
	plusPlayList(true);
});
$('.btn_add_list').on('click', function() {
	plusPlayList(false);
	makeSnack('1곡이 재생목록에 담겼습니다.');
});
$('.btn_add_playlist').on('click', function() {
	if(!isLogin) {
		makeLoginPop(); 
		return;
	}
});



