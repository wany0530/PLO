<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plo</title>
<script src="${path}/z02_js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${path}/z01_css/default.css">
<script type="text/javascript" src="/jspexp/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">

</script>
<style>
    body{
    margin:0px;
    padding:0px;
    }
    
   .section_inner {
    width: 1080px;
    margin: 0 auto;
    padding-top: 70px;
    padding-bottom:110px;
    }
    
    .text{
     font-weight:bold;
     font-size:20px;
     }
   
    .tab{
     overflow: hidden;
     position: relative;
     padding-right: 40px;
     height: 32px;
     float:right;
     }
  
    .section_search .tab{
     margin-top:25px;
     }
  
    .tab{
     overflow: hidden;
     position: relative;
     padding-right: 40px 30px;
     height: 50px;
     top:-20px;
     font-size:15px;
     font-weight:bold;
     }
  
     .tab li{
     display:inline-block;
     padding:10px 30px; 
     } 
  
     .albumC{
     color:#FF8533;
     }
   
     .album{
     display:inline-block;
     height:500px;
     width:1028px;
     }
     
     li {
     	text-decoration: none;
     	list-style: none;
     }
     
  
    .albumDetail{
     display:inline-block;
     height:150px;
     width:150px;
     padding:20px;
     font-size:15px;
     font-weight:bold;
     }
  
    .albumText{
    font-size:15px;
    font-weight:bold;
     }
  
    .albumArtist{
     font-size:15px;
     font-weight:bold;
     top:-30px;
     }
  
</style>
<script type="text/javascript">

</script>
</head>
<body>

   <div class="wrapper">
    </div>
   <div class="page">
   <div class="section_inner">
   <div class="text">
    <h2></h2>
    </div>

  <div class="tab">
 
 <ul>
   <li><a href="${path}/MusicSearch?keyword=${param.keyword}">???</a></li>
   <li class="albumC"><a href="${path}/AlbumSearch?keyword=${param.keyword}">??????</a></li>
   <li><a href="${path}/ArtistSearch?keyword=${param.keyword}">????????????</a></li>
   <li><a href="${path}/LyricsSearch?keyword=${param.keyword}">??????</a></li>
 </ul>

  </div>

<div class="album">
 <c:forEach var="album" items="${albumList}">
   <li>
    <img src="${path}/${album.alb_img }" width="150px" height="150px">
    <!-- path??? ?????? sql??? ???????????? ????????? -->
      <span class="albumDetail">
      <div class="albumText">
      ${album.alb_name }<br><br><br>
      </div>
      <div class="albumArtist">
       ${album.alb_date }
        <br><br>
       <br><br>
      </div>
      </span>  
   </li>
  </c:forEach>
 <%@ include file="footer.jsp"%>
 </div>

</div>
 <%@include file="../a09_playList/musicplayer.jsp" %>
</body>
</html>