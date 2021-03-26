<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- Custom styles for this template-->
<link href="${path}/z01_css/admin/sb-admin-2.min.css" rel="stylesheet">

<style>
#top-nav { height: 100px; }
.container-fluid { padding: 50px; }

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
						<h1 class="h3 mb-3 text-gray-800">PLO 정보</h1>
					</div>

					<!-- Content Row -->
					<div class="row mb-4">

						<!-- 회원 수 -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Number of User</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${cnts.get(0)}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 공지사항 수 -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-danger shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-danger text-uppercase mb-1">
												Number of Notice</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${cnts.get(1)}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- FAQ 수 -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">
												Number of FAQ</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${cnts.get(2)}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Content Row -->

					<!-- Content Row -->
					<div class="row mb-4">

						<!-- 아티스트 수 -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-secondary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-secondary text-uppercase mb-1">
												Number of Artist</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${cnts.get(3)}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 앨범 수 -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Number of Album</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${cnts.get(4)}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 음원 수 -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Number of Music</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${cnts.get(5)}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Content Row -->

					<!-- Content Row -->
					<div class="row mb-4">
						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">장르 선호도</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="myPieChart"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> 발라드
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> 팝
										</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
											트로트
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Content Row -->

				</div>
				<!-- Begin Page Content -->

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#top-nav"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="${path}/a00_admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="${path}/a00_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${path}/a00_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${path}/z02_js/admin/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${path}/a00_admin/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${path}/z02_js/admin/demo/chart-pie-demo.js"></script>

	</div>
</body>
</html>