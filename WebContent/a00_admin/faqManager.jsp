<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLO-관리자페이지</title>

<!-- Custom fonts for this template-->
<link href="${path}/a00_admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path}/z01_css/admin/sb-admin-2.min.css" rel="stylesheet">

<!-- jquery -->
<script src="${path}/z02_js/jquery-3.5.1.js"></script>

<!-- Boot Strab -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<style>
#top-nav { height: 100px; }
.container-fluid { padding: 50px; }
.pageBtn, .delBtn { overflow-x: scroll; white-space: nowrap; }


</style>
</head>
<body>
	
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav sidebar sidebar-dark accordion"
			id="accordionSidebar" style="background: #ff8533;">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${path}/a01_main/main.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">PLO</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="${path}/admin"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>관리자</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Member Managerment</div>

			<!-- Nav Item - 회원관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapse_user"
				aria-expanded="true" aria-controls="collapse_user"> <i
					class="fas fa-fw fa-cog"></i> <span>회원관리</span>
			</a>
				<div id="collapse_user" class="collapse">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">회원관리:</h6>
						<a class="collapse-item" href="${path}/userManager">회원 조회</a> <a
							class="collapse-item" href="${path}/userReg">회원 등록</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Music Managerment</div>

			<!-- Nav Item - 아티스트 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapse_artist"
				aria-expanded="true" aria-controls="collapse_artist"> <i
					class="fas fa-fw fa-cog"></i> <span>아티스트 관리</span>
			</a>
				<div id="collapse_artist" class="collapse">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">아티스트 관리:</h6>
						<a class="collapse-item" href="${path}/artistManager">아티스트 조회</a>
						<a class="collapse-item" href="${path}/artistReg">아티스트 등록</a>
					</div>
				</div></li>

			<!-- Nav Item - 음원 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapse_music"
				aria-expanded="true" aria-controls="collapse_music"> <i
					class="fas fa-fw fa-cog"></i> <span>음원 관리</span>
			</a>
				<div id="collapse_music" class="collapse">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">음원 관리:</h6>
						<a class="collapse-item" href="${path}/musicManager">음원 조회</a> <a
							class="collapse-item" href="${path}/musicReg">음원 등록</a>
					</div>
				</div></li>

			<!-- Nav Item - 앨범 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapse_album"
				aria-expanded="true" aria-controls="collapse_album"> <i
					class="fas fa-fw fa-cog"></i> <span>앨범 관리</span>
			</a>
				<div id="collapse_album" class="collapse">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">앨범 관리:</h6>
						<a class="collapse-item" href="${path}/albumManager">앨범 조회</a> <a
							class="collapse-item" href="${path}/albumReg">앨범 등록</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Service Center</div>

			<!-- Nav Item - 공지사항 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapse_notice"
				aria-expanded="true" aria-controls="collapse_notice"> <i
					class="fas fa-fw fa-cog"></i> <span>공지사항 관리</span>
			</a>
				<div id="collapse_notice" class="collapse">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">공지사항 관리:</h6>
						<a class="collapse-item" href="${path}/noticeManager">공지사항 조회</a>
						<a class="collapse-item" href="${path}/noticeReg">공지사항 등록</a>
					</div>
				</div></li>

			<!-- Nav Item - FAQ 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapse_faq"
				aria-expanded="true" aria-controls="collapse_faq"> <i
					class="fas fa-fw fa-cog"></i> <span>FAQ 관리</span>
			</a>
				<div id="collapse_faq" class="collapse">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">FAQ 관리:</h6>
						<a class="collapse-item" href="${path}/faqManager">FAQ 조회</a> <a
							class="collapse-item" href="${path}/faqReg">FAQ 등록</a>
					</div>
				</div></li>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-3 text-gray-800">FAQ 정보</h1>
					</div>

					<!-- DataTale -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold" style="color:#ff8533;">FAQ 조회</h6>
						</div>

						<!-- DataTable : Data -->
						<div class="card-body pb-0">
							<div class="table-responsive">
								<form method="post" id="table-form">
								<input type="hidden" value="" name="isDelete">
								<table class="table table-bordered table-hover" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr> 
											<th>번호</th>
											<th>제목</th>
											<th>내용</th>
											<th>공개여부</th>
											<th>구분명</th>
											<th class="text-center"><input type="checkbox" onclick="allSelect()" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="faq" items="${list}">
										<tr ondblclick="detail(${faq.f_no})">
											<td>${faq.f_no}</td>
											<td>${faq.f_title}</td>
											<td>${faq.f_content}</td>
											<td>${faq.f_pub}</td>
											<td>${faq.fc_name}</td>
											<td class="text-center"><input type="checkbox" name="checkId"
												value="${faq.f_no}"/></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								</form>
							</div>

							<!-- table bottom -->
							<div class="row mb-1">
								<c:set var="page" value="${(empty param.p)?1:param.p}" />
								<c:set var="startNum" value="${page-(page-1)%5}"/>
								<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(cnt/10), '.')}"/>

								<!-- page info -->
								<div class="col-sm-12 col-md-12 col-lg-2 mb-2">
									<div>${page} / ${lastNum}</div>
								</div>

								<!-- page button -->
								
								<div class="pageBtn col-sm-12 col-md-9 col-lg-8 text-center mb-3">
									<form method="get">
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										
										<button type="button" class="btn" style="color:#ff8533; border:1px solid #ff8533;" ${(startNum <= 1)?'disabled':''}
										onclick="paging(${startNum-1})">
											Previous
										</button>
										
										<c:forEach begin="${startNum}" end="${startNum+4}" varStatus="status">
											<c:if test="${lastNum >= status.current}">
											<button type="button" class="btn" 
												style="color:${((page)==(status.current))?'white':'#ff8533'};
													 border:1px solid #ff8533; background: ${((page)==(status.current))?'#ff8533':'white'};"
												onclick="paging(${status.current})">
												${status.index}
											</button>
											</c:if>
										</c:forEach>
										
										<button type="button" class="btn" style="color:#ff8533; border:1px solid #ff8533;" ${(lastNum <= startNum+4)?'disabled':''}
										onclick="paging(${startNum+5})">
											Next
										</button>
									</div>
									</form>
								</div>

								<!-- del button -->
								<div class="delBtn col-sm-12 col-md-3 col-lg-2 text-right">
									<button type="button" class="btn btn-danger" id="delBtn">일괄 삭제</button>
								</div>

							</div>
							<!-- End of table bottom -->

						</div>
						<!-- End of DataTable : Data -->
						
					</div>
					<!-- End of DataTable -->
					
				</div>	
				<!-- End of Begin Page Content -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Wrapper -->
	
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" hidden data-bs-toggle="modal" data-bs-target="#detail">
	  Launch demo modal
	</button>
	
	<!-- Detail Modal -->
	<div class="modal fade" id="detail" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">FAQ 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				
				<form method="post" id="modal-form">
				<input type="hidden" value="" name="isUpdate"/>
				<div class="modal-body wd-70">
					<div class="input-group mb-3">
						<span class="input-group-text w-30 d-block" id="inputGroup-sizing-default">번호</span>
						<input type="text" class="inId form-control" aria-label="Sizing example input" 
						aria-describedby="inputGroup-sizing-default" readonly="readonly" name="f_no">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text w-30 d-block" id="inputGroup-sizing-default">제목</span>
						<input type="text" class="inId form-control" aria-label="Sizing example input" 
						aria-describedby="inputGroup-sizing-default" name="f_title">
					</div>
					<div class="input-group mb-3">
						<textarea class="w-100" rows="10" style="text-align: left;" name="f_content"></textarea>
					</div>
					<div>
						<input id="pub" type="checkbox" name="f_pub"/>
						<label for="pub">공개여부</label>
					</div>
					<select name="fc_no">
					</select>
				</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn" style="background: #ff8533; color: white;"
						data-bs-dismiss="modal" id="update">수정</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Detail Modal -->
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#top-nav"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="${path}/a00_admin/vendor/jquery/jquery.min.js"></script>
	<script src="${path}/a00_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${path}/a00_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${path}/z02_js/admin/sb-admin-2.min.js"></script>

	<script>
		function paging(page){
			location.href="?p="+page;
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open("get", "${path}/a00_admin/z07_faqCode.jsp", true);
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var faqCode = JSON.parse(xhr.responseText);
				var show;
				$(faqCode.codeList).each(function(idx, code){
					show += '<option value="'+code.fc_no+'">'+code.fc_name+'</option>';
				});
				$('[name=fc_no]').html(show);
			}
		}
		xhr.send();
		
		function detail(no){
			xhr.open("get", "${path}/a00_admin/z07_faqDetail.jsp?no="+no, true);
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200){
					var faq = JSON.parse(xhr.responseText);
					$('[name=f_no]').val(faq.f_no);
					$('[name=f_title]').val(faq.f_title);
					$('[name=f_content]').val(faq.f_content);
					if(faq.f_pub == 0)
						$('[name=f_pub]').prop("checked", false);
					else
						$('[name=f_pub]').val("1").prop("checked", true);
					$('[name=fc_no]').val(faq.fc_no);
				}
			};
			xhr.send();
			$('[data-bs-target="#detail"]').trigger('click');
		}
		
		// 업데이트
		$('#update').on('click', function(){
			$('[name=isUpdate]').val('true');
			$('#modal-form').submit();
		});
		// 삭제
		$('#delBtn').on('click', function(){
			if(confirm("정말 삭제하시겠습니까?")){
				$('[name=isDelete]').val("true");
				$('#table-form').submit();
			}
		});
		
		// 체크박스
		var select = false;
		function allSelect(){
			var allCheckBox = $('[name="checkId"]');
			for(var i=0; i<allCheckBox.length; i++){
				if(select == false) {
					allCheckBox[i].checked = true;
				}
				else {
					allCheckBox[i].checked = false;
				}
			}
			select = !select;
		}
	</script>
</body>
</html>