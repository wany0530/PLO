      $("#mylist-cancel").on("click",function(){
    	  $(".modal").css("display", "none");
      })
      
      
      
      // 듣기버튼 클릭시 하단 팝업 X 기능
      $(".xlogin-playboxs-close").on("click",function(){
    	  $(".no-login-play-box").css("display","none");
      })
      
      
	  // 체크박스
	  var isprod = true;
	  var checkcnt = 0;
	  // 체크박스 전체 체크  (팝업창)
	   $("#Pbox").on("click", function(){
		   if(isprod == true){
			   $("[name=ckchild]").prop("checked", true);
			   $(".music-check-box").css("display","flex");
			   checkcnt = $("[name=ckchild]").length;
			   $("#checkcnt").text(checkcnt);
			   isprod=false;
		   }else{
			   $("[name=ckchild]").prop("checked", false);
			   $(".music-check-box").css("display","none");
			   checkcnt = 0;
			   $("#checkcnt").text(checkcnt);
			   isprod=true;
		   }
	   });
	  // 체크박스 각각클릭시 (팝업창)
	  $("[name=ckchild]").on("click",function(){
		  if($(this).prop("checked")){
			  checkcnt++;
		  }else{
			  checkcnt--;
		  }
		 if(checkcnt != 0){
			 $(".music-check-box").css("display","flex");
			 $("#checkcnt").text(checkcnt);
		 }else{
			 $(".music-check-box").css("display","none");
		 }
	  })
	  // 체크팝업창 선택해제
	  $(".music-check-items").eq(0).on("click",function(){
			  checkcnt = 0;
			  $("[name=ckchild]").prop("checked", false);
			  $(".music-check-box").css("display","none");
			   $("#checkcnt").text(checkcnt);
			   $("#Pbox").prop("checked", false);
		  });
