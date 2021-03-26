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
<title>PLO</title>
<link rel="stylesheet" href="${path}/z01_css/default.css">
<link rel="stylesheet" href="${path}/z01_css/musicDetail.css">
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
</head>
<body>
	<%-- controller :: /musicdetail --%>
	<div id="app">
	<%@ include file="../a01_main/header.jsp" %>
		<div id="wrap">
			<section id="main" class="section_detail">
				<div class="section_inner">
					<div class="bagde_area">
						<div class="album_thumbnail">
							<div class="link_thumbnail">
								<img src="${path}${music.m_path}" width="240" height="240" alt="${music.m_name}">
							</div>
							<button class="btn_thumbnail_play">${music.m_name} 듣기</button>
						</div>
						<div class="badge_track_info">
							<div class="info_area">
								<p class="title"><a href="#">${music.m_name}</a></p><%--앨범정보이동 --%>
								<p class="artist"><a href="#">${music.art_name}</a></p><%--가수정보이동 --%>
								<p class="album"><a href="#">${music.alb_name}</a></p><%--앨범정보이동 --%>
							</div>
							<div class="util_area">
								<button type="button" class="btn_add_list">재생 목록 담기</button>
								<button type="button" class="btn_add_playlist">내 리스트 담기</button>
								<button type="button" class="btn_like">좋아요</button>
							</div>
						</div>
					</div>
					<div  class="section_content_wrap">
						<div class="music_detail_info">
							<div class="info_txt">
								<dl>
									<dt>곡명</dt>
									<dd>${music.m_name}</dd>
								<%--<dt>작곡</dt>
									<dd>용감한 형제</dd>--%>
								</dl>
							</div>
							<div class="lyrics">${music.m_lyrics}</div>
						</div>
					</div>
				</div>
				<%@ include file="../a01_main/footer.jsp" %>
			</section>
		</div>
		<%@ include file="../a09_playList/musicplayer.jsp" %>
	</div>
<script>
var m_no = "${music.m_no}";
</script>
<script type="text/javascript" src="${path}/z02_js/musicdetail.js"></script>
</body>
</html>