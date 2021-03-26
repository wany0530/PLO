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
<link rel="stylesheet" href="${path}/z01_css/mylist-popup.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
//
   $(document).ready(function(){
      
   });
</script>
</head>
<body>
	<div class="mylistInput">
    <div class="mylistInput-content">
        <div class="mylistInput-text">
            <span>내 리스트에 담기</span>
            <input type="button" class="close" value="X"></input>
        </div>
        <!-- 새로운 리스트 추가하기-->
        <div class="mylistinput-insert">
            <div class="inputbox">
                <div class="addicons">
                    <svg style="color: orange;" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </div>
                <div class="addtext">
                    <span>새로운 리스트 추가하기</span>
                </div>
            </div>
        </div>
        <!-- 내 리스트 이름을 입력해주세요. -->
        <div class="mylistadd-box">
            <div class="mylistadd-text">
                <input type="text" placeholder="내 리스트 이름을 입력해 주세요"/>
                <button type="button">X</button>
            </div>
            <div class="mylistadd-button">
                <button>취소</button>
                <button style="color: orange;">확인</button>
            </div>
        </div>
        <!--기존에 남아있는 박스-->
        <div class="mylistInput-list">
            <div class="list-info-box">
                <div class="list-image" style="background-image: url(ilbuni.png);"></div>
                <div class="list-info">
                    <span>리스트 명</span>
                    <span class="list-info-cnt">1곡</span>
                </div>
            </div>
        </div>
        
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>