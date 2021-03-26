<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#footer { margin-top: 70px; }
#footer #footer_inner { max-width: 1440px; margin: 0 auto; }
#footer #footer_inner #top_menu { border-bottom: 1px solid #f5f5f5; padding-bottom: 20px; margin-bottom: 20px; }
#footer #footer_inner #top_menu li { display: inline-block; margin-right: 22px; }
#footer #footer_inner #top_menu li a { font-size: 14px; font-weight: 700; }

#footer #footer_inner #middle_menu li { display: inline-block; }
#footer #footer_inner #middle_menu li:after { content: "|"; margin: 0 15px; color: #4a4a4a; font-size: 12px; }
#footer #footer_inner #middle_menu li a { color: #4a4a4a; font-size: 12px; }
#footer #footer_inner #middle_menu li strong { font-weight: 700; }

#footer #footer_inner #bottom_menu div { padding-top: 20px; font-size: 12px; color: #909090;}
#footer #footer_inner #bottom_menu div:nth-child(1) { line-height: 10px; }
#footer #footer_inner #bottom_menu div:nth-child(2) { line-height: 25px; }

#footer #footer_inner #copyright { padding-top: 10px; padding-bottom: 0; font-size: 11px;
	color: #181818; font-weight: 400 }
</style>
<!-- footer -->
<footer id="footer">

	<div id="footer_inner">
	
		<div id="top_menu">
			<ul>
				<li><a href="${path}/a01_main/intro.html">PLO소개</a></li>
				<li><a href="${path}/notice">공지사항</a></li>
				<li><a href="${path}/faq">고객센터</a></li>
			</ul>
		</div>
		<div id="middle_menu">
			<ul>
				<li><a>회사소개</a></li>
				<li><a>이용약관</a></li>
				<li><a><strong>개인정보 처리방침</strong></a></li>
				<li><a>청소년 보호정책</a></li>
				<li><a>사업자정보 확인</a></li>
			</ul>
		</div>
		<div id="bottom_menu">
			<div>
				대표이사:양현수 | 이메일:plo@music.co.kr | 사업자 등록번호:214-88-88888 | 통신판매업 신고번호:2008-서울서초-1000
			</div>
			<div>
				플로하우스:서울특별시 서초구 강남대로111 드림플러스 15F | 대표전화:1555-5555<br>
				아이리버:서울특별시 서초구 방배로 18길 5| 대표전화:1555-5555
			</div>
		</div>
		<div id="copyright">
			(주)PLO컴퍼니 ALL RIGHTS RESERVED
		</div>
	</div>
	
</footer>