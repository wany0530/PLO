<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- font Awesom -->


 <style>
    .header-container{
        position: fixed;
        width:100%;
        z-index: 0;
        height: 82px;
        background-color:white;
        color: black;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 10px;

    }
    .header-box{
        width: 85%;
        height: 100%;
        display: flex;
        padding-bottom: 10px;
        padding-right: 10px;
    }
    .header-box-items:nth-child(1){
        flex: 2 0 0;
    }
    .header-box-items:nth-child(2){
        flex: 1 0 0;
        margin-left: 15px;
    }
    .header-box-items:nth-child(3){
        flex: 1 0 0;
    }
    .header-box-items:nth-child(4){
        flex: 8 0 0;
    }
    .header-box-items:nth-child(5){
        flex: 3.5 0 0;
    }
    .header-logo{
        width: 56px;
        height: 25px;
        background-color:rgba(0,0,0,0);
        margin-left: 38%;
        margin-top: 45px;
        border: none;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
    .header-logo:focus{
        outline: none;
    }
    .header-chart{
        background: none;
        font-size:12pt;
        border: none;
        margin-left: -5px;
        margin-top: 50px;
    }
    .header-chart:focus{
        background: none;
        outline: none;
    }
    .header-store{
        background: none;
        border: none;
        font-size:12pt;
        margin-left: -5px;
        margin-top: 50px;
    }
    .header-store:focus{
        background: none;
        outline: none;
    }
    .header-search{
        width: 39%;
        border-radius: 15px;
        margin-top: 46px;
        height: 43%;
        font-size: 10pt;
        color: gray;
        border: 1px solid lightgray;
    }
    .header-introduce{
        background: none;
        border: none;
        margin-left: 30px;
        margin-top: 45px;
        color: gray;
        font-size: 12pt;
    }
    .header-introduce:focus{
        background: none;
        outline: none;
    }
    .header-charactor{
        background: none;
        border: none;
        margin-left: 18px;
        margin-top: 45px;
        color: black;
        font-size: 12pt;
    }
    .header-charactor:focus{
        background: none;
        outline: none;
    }
    .header-icon{
        width: 40px;
        height: 40px;
        margin-left: 220px;
        margin-top: -35px;
        font-size: 10pt;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        border-radius:50%;
    }
    </style>
    </head>
    <body>
        <div class="header-container">
           <div class="header-box">
                <div class="header-box-items">
                    <button class="header-logo" style="background-image:url(./z00_imgs/logo.png);"></button>
                </div>
                <div class="header-box-items">
                    <button class="header-chart">둘러보기</button>
                </div>
                <div class="header-box-items">
                    <button class="header-store">보관함</button>
                </div>
                <div class="header-box-items">
                    <input type="search" class="header-search" value="검색어를 입력하세요."></input>
                </div>
                <div class="header-box-items">
                    <button class="header-introduce">PLO 소개</button>
                    <button class="header-charactor">${u.u_name}</button>
                    <div class="header-icon" style="background-image:url(./z00_imgs/mylist_img01.jpg);"></div>
                </div>
           </div>

        </div>
    </body>
</html>