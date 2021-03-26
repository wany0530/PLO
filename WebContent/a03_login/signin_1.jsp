<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLO</title>
<style>
a{ 	text-decoration:none;  color:black; color: inherit}
ul{list-style: none;}
.signin_content{
	margin:0 auto;	height:1200px;	}
.logo{
	width : 72px;	height : 32px;	display : absolute; margin-left : 47%;	margin-top : 150px;	}
#box{
	margin : 0 auto;	width : 620px;	height : 700px;	border : 1px solid lightgray;	margin-top : 80px;	}
#title{
	margin-left : 250px;	margin-top : 75px;	font-size : 30px;	font-weight : bold;}
hr{
	width : 400px;	size : 1px;	color : #ebebeb;	align : center;	}
#topline{
	margin-top : 35px;	margin-bottom : 30px;}
#bottomline{
	margin-top : 25px;	margin-bottom : 30px;}
#check_tab{ /*테이블*/
	width : 400px;	height : 250px;	margin-left : 110px; border : none;}
td{
	padding : 10px; border : none;}
#color{
	color : #FF8533; font-weight:bold;}
#allText{
	font-size : 13px;	font-weight : lighter;	color : gray; cursor: pointer;}
#allCheck{
	width : 400px;	height : 250px;	margin-left : 120px;	}
button:focus{
	outline : none; }
#nextBtn{
	width : 380px;	height : 70px;	background-color : #FF8533;	border : none;	margin-top : 50px;	margin-right: 10px;}
#popup1, #popup2, #popup3, #popup4, #popup5 {
    display: none; position: absolute; top : 0%; left : 0%; width: 100%; height: 100%; background: rgba(0,0,0,0.4);}
#popmenu{
	position: absolute;	margin : 0 auto; top: 50%; left : 50%; transform: translate(-50%,-50%); width: 800px; height: 600px; text-align: justify;
    background: #fff; padding : 40px; overflow : scroll;}
#contitle{
	font-weight:bold; font-size:20px; text-align:center;}
</style>
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>

</head>
<body>
	<%@ include file="../a01_main/header.jsp" %>
	<div class="signin_content">
		
		<img class="logo" src="../z00_imgs/logo.png"/>
		
		<div id="box">
	   		<div id="title">이용약관</div>
	   		<hr id= "topline">
	   		
	   		<table id="check_tab" border>
	   			<col width="75%"><col width="25%">
	   			<tr>
	   				<td><label><input type="checkbox" id="ckbx">  
	   					<span id="color">(필수)</span> 이용약관</label></td>
	   				<td><span id="allText1">전문보기</span></td>
	   			</tr>
	   			<tr>
	   				<td><label><input type="checkbox" id="ckbx">  
	   					<span id="color">(필수)</span> 개인정보 수집 및 이용안내 </label></td>
	   				<td><span id="allText2">전문보기</span></td>
	   			</tr>
	   			<tr>
	   				<td><label><input type="checkbox" id="ckbx" >  
	   					<span id="color">(필수)</span> 제 3자 제공 동의 </label></td>
	   				<td><span id="allText3">전문보기</span></td>
	   			</tr>
	   			<tr>
	   				<td><label><input type="checkbox" id="ckbx" >  
	   					(선택) 제 3자 제공, 처리위탁 동의 </label></td>
	   				<td><span id="allText4">전문보기</span></td>
	   			</tr>
	   			<tr>
	   				<td><label><input type="checkbox" id="ckbx">  
	   					(선택) 광고 수신 동의 </label></td>
	   				<td><span id="allText5">전문보기</span></td>
	   			</tr>
	   		</table>
			<hr id= "bottomline">
			
	   		<div id="allCheck">
	   			<input type="checkbox" onclick="allSelect()" id="allCk"/>  
		   		<span style="font-weight:bold; font-size:17px;">전체동의</span><br>
				<span style="color : gray; font-size:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(선택)  광고 수신 동의를 포함하여 모두 동의합니다.</span>
	   			<button id="nextBtn"><span style="font-weight:bold; color:#fff; font-size:15px;">다음</span></button>
	   		</div>	   			   		
		</div>		
   </div>
	<%@ include file="../a01_main/footer.jsp" %>
   
   	   		
	<div id="popup1">
	   	<div id="popmenu">
	   		<span id="contitle">이용약관</span><br><br><br>
		    <p> 
		    PLO 회원 이용약관<br><br>
			제1조 (목적) <br>본 약관은 주식회사 쌍용교육센터 (이하 "회사") 가 제공하는 유무선 온라인상에서 제공되는 PLO 서비스(이하 "서비스") 이용과 관련하여 회원과 회사 간의 권리, 의무, 책임사항 및 회원의 서비스 이용조건 및 절차 등 기본적인 사항을 규정함을 그 목적으로 합니다.<br><br>
			제2조 (약관의 효력 및 변경) <br>1. 본 약관은 서비스를 이용하고자 하는 모든 회원에게 그 효력이 발생합니다.<br><br>
			2. 회사는 본 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 화면에 게시하거나 회원이 요구할 경우 약관의 사본을 회원에게 제공할 수 있으며, 기타의 방법으로 회사가
			회원에게 공지합니다.<br><br>
			3. 회사는 필요하다고 인정되는 경우 관련 법령을 위반하지 않는 범위에서 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 때에는 적용 일자와 변경사유를 밝혀 본 조 제2항과 같은 방법으로 그 적용일자 10일 전부터 공지합니다. 
			단, 회원에게 불리하게 약관을 변경할 때에는 그 적용일자 30일 전부터 공지하며, 제8조의 통지수단으로 회원에게 개별 통지합니다. (회원이 연락처를 기재하지 않았거나 변경하여 개별 통지가 어려울 때에는 서비스화면에 변경 약관을 공지하는 것을 개별 통지로 갈음합니다.)<br><br>
			4. 회사가 본조제3항에 따라 변경 약관을 공지 또는 통지하면서, 회원에게 약관 변경 적용일까지 거부의사를 표시하지 아니하는 경우 약관의 변경에 동의한 것으로
			간주한다는 내용을 명확하게 공지 또는 통지하였음에도 회원이 변경된 약관의 효력 발생일까지 약관 변경에 대한 명시적인 거부의 의사를 표시하지 아니하면 회원이 변경 약관에 동의한 것으로 간주합니다.<br><br>
			5. 회원은 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고, 회원 해지 신청을 통해 회사와의 이용계약을 해지할 수 있습니다.<br><br>
			6. 본 약관에 동의하는 것은 회사가 운영하는 서비스의 홈페이지를 정기적으로 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를
			알지 못하여 발생하는 회원의 피해에 대하여는 회사는 책임 지지 않습니다.<br><br><br>
			제3조 (약관 외 준칙) <br>
			1. 본 약관에 명시되지 않은 사항은 전기통신사업법, 정보통신망이용촉진 및 정보보호 등에 관한 법률, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령 및 회사가
			정한 서비스의 이용 지침 등의 규정을 따릅니다.<br><br>
			2. 회사는 필요한 경우 서비스 내의 특정 서비스에 관하여 적용될 사항(이하 "개별약관")을 정하여 이를 제2조제2항의 방법에 따라 공지할 수 있습니다.<br><br>
			3. 회사는 필요한 경우 서비스 이용과 관련된 세부이용지침을 정하여 이를 제2조제2항의 방법에 따라 공지할 수 있습니다.<br><br>
			4. 본 약관과 관련하여 회사의 정책 변경, 법령의 제·개정 또는 공공기관의 고시나 지침 등에 따라 회사가 공지사항 게시판 등을 통해 공지하는 내용도 이용계약의 일부를
			구성합니다.<br><br><br>
			제4조 (용어의 정의) <br>1. 본 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.<br><br>
			1 회원 서비스를 이용하기 위해서 서비스 애플리케이션 등에 접속하여 본 약관에 동의하고 서비스 이용을 신청하여 회사로부터 서비스 이용에 대한 자격을 부여 받은
			모든 고객 <br><br>2 결제: 회원이 특정 서비스를 이용하기 위하여 각종 결제수단을 통하여 회사가 특정 서비스에 대하여 정한 일정 금액을 회사에 지불하는 것<br> <br>
			3 서비스 중지 : 정상 이용 중 회사가 정한 일정한 요건에 따라 일정기간 동안 서비스의 제공을 중지하는 것 <br><br>4 결제취소 : 회원이 서비스를 결제한 이후에 본 약관에서 정한 바에 따른 일정한 절차에 따라 결제 행위 자체를 취소하는 것 <br><br>
			5 환불: 회사가 결제수단별 승인취소 등의 방법을 전제로 본 약관에서 정한 바에 따라 결제금액을 반환하는 것<br><br>
			
		   </p>
      	</div>
	</div>
	
	<div id="popup2">
	   	<div id="popmenu">
	   		<span id="contitle">개인정보 수집 및 이용안내</span><br><br><br>
		    <p>
		    회원 가입, 서비스 및 고객센터 이용, 이벤트 참여, 팩스/전화 문의 등의 과정에서 필요 최소한의 개인정보를 수집하고 있으며, 이를 사전에 고지하고 동의를 구하고 있습니다.<br><br>
			플로 서비스의 본질적인 기능 수행을 위해 필요한 필수정보를 수집합니다.<br>
			선택적인 목적(부가적인 서비스 또는 기능을 제공)을 위해 추가적으로 요구하는 정보는 선택항목으로 구분하여 수집합니다. (선택적 목적에 동의하지 않아도 서비스 이용에는 제한이 없습니다.)<br>
			서비스 이용 기록, IP Address, 쿠키, 접속기기 모델명 및 OS정보 등은 자동으로 생성되어 수집되며, 서비스에 대한 부정이용 방지, 이용 내역 확인, 접속 빈도 및 이용 통계, 
			고객 문의 사항 처리, 그리고 서비스 개선 등의 목적에 활용됩니다.<br><br><br>
			
			<span id="color">회원가입 단계에서 수집하는 개인정보</span><br><br>
			<span id="color">필수항목</span><br>
			이름, 생년월일, 아이디, 비밀번호, 이메일, 닉네임, 휴대폰번호, 성별, 만 14세 미만 아동의 경우, 법정대리인 정보(법정대리인명, 성별, 생년월일, 휴대폰번호, 통신사업자, 내/외국인 여부, 
			암호화된 이용자 확인값(CI))<br><br>
		    회원 식별 및 가입의사 확인, 회원제 서비스 운영<br>
		    (만 14세 미만 아동의 경우) 법정대리인 동의 여부 확인<br>
			서비스 고지사항(이벤트 당첨안내 포함) 전달, 고객문의 처리 등 중요 공지 전달을 위한 의사소통 경로 확보<br>
			서비스 관련 제반 법령 위반 행위 및 서비스 부정이용 행위 제재<br>
			
		    </p>
		</div>
	</div>
	
	<div id="popup3">
	   	<div id="popmenu">
	   		<span id="contitle">제 3자 제공 동의</span><br><br><br>
		    <p> 
		    본인은 (주)쌍용교육센터에서 제공하는 PLO 서비스(이하 "서비스")를 이용하기 위해 하기와 같이 SK텔레콤(주)이 
		    (주)쌍용교육센터에 본인의 개인정보를 제공하는 것에 동의합니다.<br><br><br>
			<span id="color">제공받는 자</span><br>
			(주)쌍용교육센터<br><br>
			<span id="color">제공받는 자의 이용 목적</span><br>
			서비스 제공 및 요금제별 혜택 제공<br><br>
			<span id="color">제공하는 개인정보</span><br>
			생년월일, 성별, 개인식별연계정보, 개인정보 이동전화번호, 서비스관리번호, 요금제 정보, 멤버십 정보, 부가서비스 가입 정보, 이동전화,번호변경/명의변경/정지/해지<br><br>
			<span id="color">제공받는 자의 보유/이용목적</span><br>
			SK텔레콤 서비스 이용기간 또는 개인정보 유효기간 도래 시까지 보관  단, 법령 상 보관의무 *가 있는 경우에는 해당 법령이 정한 기간에 따라 보관합니다.<br><br><br>
			회원님은 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있습니다. 단, 동의 거부 시 서비스의 이용이 불가능합니다.<br><br>
			*유효기간이라 함은 일정기간(1년) 서비스를 이용하지 않은 경우로써, 탈퇴 등의 조치가 적용됩니다.<br><br>
			**관계법령이라 함은 다음에 해당되는 경우를 말합니다.<br>
			가. 웹사이트 방문기록 : 3개월 (통신비밀보호법) <br>
			나. 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래법) <br>
			다. 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래법)<br>
			라. 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래법)<br>	    
		    </p>
		</div>
	</div>
	
	<div id="popup4">
	   	<div id="popmenu">
	   		<span id="contitle">제 3자 제공, 처리위탁 동의</span><br><br><br>
		    <p> 
		    본인은 (주)쌍용교육센터에서 제공하는 PLO 서비스(이하 "서비스")를 이용하기 위해 하기와 같이 SK텔레콤(주)이 
		    (주)쌍용교육센터에 본인의 개인정보를 제공하는 것에 동의합니다.<br><br><br>
			<span id="color">제공받는 자</span><br>
			(주)쌍용교육센터<br><br>
			<span id="color">제공받는 자의 이용 목적</span><br>
			서비스 제공 및 요금제별 혜택 제공<br><br>
			<span id="color">제공하는 개인정보</span><br>
			생년월일, 성별, 개인식별연계정보, 개인정보 이동전화번호, 서비스관리번호, 요금제 정보, 멤버십 정보, 부가서비스 가입 정보, 이동전화,번호변경/명의변경/정지/해지<br><br>
			<span id="color">제공받는 자의 보유/이용목적</span><br>
			SK텔레콤 서비스 이용기간 또는 개인정보 유효기간 도래 시까지 보관  단, 법령 상 보관의무 *가 있는 경우에는 해당 법령이 정한 기간에 따라 보관합니다.<br><br><br>
			회원님은 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있습니다. 단, 동의 거부 시 서비스의 이용이 불가능합니다.<br><br>
			*유효기간이라 함은 일정기간(1년) 서비스를 이용하지 않은 경우로써, 탈퇴 등의 조치가 적용됩니다.<br><br>
			**관계법령이라 함은 다음에 해당되는 경우를 말합니다.<br>
			가. 웹사이트 방문기록 : 3개월 (통신비밀보호법) <br>
			나. 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래법) <br>
			다. 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래법)<br>
			라. 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래법)<br>	    
		    </p>
		</div>
	</div>
	
	<div id="popup5">
	   	<div id="popmenu">
	   		<span id="contitle">광고수신동의</span><br><br><br>
		    <p>
		     <span id="color">목적</span><br>
			광고성 정보 전송<br><br>
			<span id="color">항목</span><br>
			휴대전화번호, 이메일<br><br>
			<span id="color">보유기간</span><br>
			회원탈퇴 또는 개인정보 유효기간* 도래까지 보관<br><br>
			단, 관계 법령**에 따라 고객님의 개인정보를 보존하여야 하는 경우,
			회사는 해당 법령에서 정한 기간동안 보관합니다.<br><br>
			회원님은 광고 수신에 대한 동의를 거부하실 권리가 있으며, 동의 거부 시에도 서비스의 이용이 가능합니다.<br><br>
			* 유효기간이라 함은 일정기간(1년) 서비스를 이용하지 않은 경우로써, 탈퇴 등의 조치가 적용됩니다.<br>
			** 관계법령이라 함은, 다음에 해당하는 경우를 말합니다. <br>
			가. 통신사실확인자료를 제공할때 필요한 로그기록자료, IP주소 등 3개월 (통신비밀보호법) <br>
			나. 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래법) <br>
			다. 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래법) <br>
			라. 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래법) <br>
			마. 신용정보의 수집·처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)<br>
			
		    </p>
		</div>
	</div>
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
<script type="text/javascript">
	
	$(document).ready(function() {
	    $("#allText1").click(function() {
	        $("#popup1").fadeIn();
	    });
	    $("#popup1").click(function() {
	        $("#popup1").fadeOut();
	    });	    
	    $("#allText2").click(function() {
	        $("#popup2").fadeIn();
	    });
	    $("#popup2").click(function() {
	        $("#popup2").fadeOut();
	    });	    
	    $("#allText3").click(function() {
	        $("#popup3").fadeIn();
	    });
	    $("#popup3").click(function() {
	        $("#popup3").fadeOut();
	    });
	    $("#allText4").click(function() {
	        $("#popup4").fadeIn();
	    });
	    $("#popup4").click(function() {
	        $("#popup4").fadeOut();
	    });
	    $("#allText5").click(function() {
	        $("#popup5").fadeIn();
	    });
	    $("#popup5").click(function() {
	        $("#popup5").fadeOut();
	    });
	    $("input").prop("checked",false);
	    $("[name=allcheck]").on("click",function(){
	    	$("input").prop("checked",true);
	    })
	    
	    var checkboxObj=document.querySelectorAll("#ckbx");
	    $("#nextBtn").click(function(){
	    	
	    	if(!checkboxObj[0].checked){
				alert("이용약관에 동의해주세요");
				checkboxObj[0].focus();
		       return false;
			}
			if(!checkboxObj[1].checked){
				alert("개인정보 수집 및 이용안내에 동의해주세요");
				checkboxObj[1].focus();
		       return false;
			}
			if(!checkboxObj[2].checked){
				alert("제 3자 제공에 동의해주세요");
				checkboxObj[2].focus();
		       return false;
			}	 	    	
	    	location.href="signin_2.jsp";
	    })
	    
	 // 체크박스
		$("#allCk").click(function(){
			if($("input:checkbox[id='allCk']").prop("checked")){
				$("input[type=checkbox]").prop("checked",true);
			} else{
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	});



</script>
</html>