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
<title>Document</title>

<link rel="stylesheet" href="${path}/z01_css/genre.css">
<link rel="stylesheet" href="${path}/z01_css/default.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
   $(document).ready(function(){
      
   });
</script>
</head>
<body>
	<div class="container-fluid" style="background: white;">
        <div class="row">
        	<%@ include file="../a01_main/header.jsp"%>
        </div>
        <div class="row" >
            <div class="col-1"></div>
            <!-- 둘러보기 메인 -->
            <div class="col" style="padding: 0px 100px; font-weight: bold;">
                <!--장르 Title-->
                <div class="row">
                    <div class="col">
                        <div class="genre-title">
                            ${m_no }
                            ${playbuttonM_no }
                        </div>
                    </div>
                </div>
                <!--장르 최신 앨범-->
                <div class="row">
                    <div class="col">
                        <div class="recently-album">
                            <span>최신앨범</span>
                            <div class="recently-album-direct">
                                <div class="before">
                                    <button>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="after">
                                    <button>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="recently-album-box">
                        	<c:forEach var="genre_album" items="${gilist}" varStatus="status">
                            <div class="recently-album-info">
                                <div class="album-info-items" style="background-image: url(${path}${genre_album.alb_img });">
                                    <button>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
                                            <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="album-info-items">${genre_album.alb_name}</div>
                                <div class="album-info-items">${genre_album.art_name}</div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!--장르 인기 아티스트-->
                 <div class="row">
                    <div class="col">
                        <div class="Popular-artist">
                            <span>인기 아티스트</span>
                            <div class="Popular-artist-direct">
                                <div class="before">
                                    <button>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="after">
                                    <button>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="Popular-artist-box">
                        <c:forEach var="genre_album" items="${gilist}" varStatus="status">
                            <div class="Popular-artist-info">
                                <div class="artist-info-items" style="background-image: url(${path}${genre_album.art_img });">
                                    <button>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
                                            <path d="M11.596 8.697l-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="artist-info-items">${genre_album.art_name }</div>
                            </div>
                        </c:forEach>                            
                        </div>
                    </div>
                </div>
                <!--개인 약관-->
            </div>
            <div class="col-1"></div>
        </div>
        <div class="row">
        	<%@ include file="../a01_main/footer.jsp"%>
        </div>
        	<%@include file="../a09_playList/musicplayer.jsp" %>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>