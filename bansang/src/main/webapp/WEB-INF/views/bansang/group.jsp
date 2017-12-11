<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<link rel="stylesheet" href="/resources/sweetalert2/dist/sweetalert2.min.css">

<style>
th, td {
	text-align: center;
}

.group-leader {
	color: red;
}
.user-info{
	padding-left : 0.5em;
}


.sw-center{
	display: inline;
	padding-left : 4.5em;
}

</style>

<div class="wrapper">
	<div class="sidebar" data-background-color="white"
		data-active-color="danger">
		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="#" class="simple-text">동네반상</a>
			</div>

			<ul class="nav">
				<li><a href="/bansang/profile"> <i class="ti-user"></i>
						<p>User Profile</p>
				</a></li>
				<li class="active"><a href="/bansang/groupList"> <i
						class="ti-view-list-alt"></i>
						<p>Group</p>
				</a></li>
				<li><a href="/bansang/storeManagement"> <i class="ti-desktop"></i>
						<p>StoreManagement</p>
				</a></li>
			</ul>
		</div>
	</div>

	<div class="main-panel">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
					<span class="icon-bar bar3"></span>
				</button>
				<a class="navbar-brand" href="#">Group</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><i class="ti-user"> </i>
							<p class="user-info">홍길동</p>
					</a></li>
					
					<li><a href="#"> <i class="ti-shift-left"> </i>
							<p class="user-info">Log Out</p>
					</a></li>
				</ul>

			</div>
		</div>
		</nav>


		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-7 col-md-7">
						<div id="groupList" class="card">
							<div class="header">
								<div class="row">
									<div class="col-xs-8">
										<h4 class="title">Group List</h4>
										<p class="category">If you add group, you enjoy service more</p>
									</div>
									<div class="col-xs-4 text-right">
										<btn id="exceldownBtn" class="btn btn-sm btn-success btn-icon">
										<i class="ti-download"></i> Download</btn></a>
										<btn id="excelupBtn" class="btn btn-sm btn-success btn-icon">
										<i class="ti-plus"></i> Register</btn>
									</div>
								</div>
							</div>
							
							
							<div class="content table-responsive table-full-width">
								<table class="table table-striped">
									<thead>
										<th>Number</th>
										<th>Group Name</th>
										<th>Group Leader</th>
										<th>Number of People</th>
										<th>Detail</th>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Java96</td>
											<td>현승우</td>
											<td>10</td>
											<td><btn
													class="moreBtn btn btn-sm btn-primary btn-icon">
												<i class="fa ti-list"></i></btn></td>
										</tr>
										<tr>
											<td>2</td>
											<td>멋쟁이사자처럼 5기</td>
											<td>이두희</td>
											<td>900</td>
											<td><btn class="moreBtn btn btn-sm btn-primary btn-icon">
												<i class="fa ti-list"></i></btn></td>
										</tr>
										<tr>
											<td>3</td>
											<td>코딩 모임</td>
											<td>현승우</td>
											<td>5</td>
											<td><btn class="moreBtn btn btn-sm btn-primary btn-icon">
												<i class="fa ti-list"></i></btn></td>
										</tr>
									</tbody>
								</table>


							</div>

						</div>
					</div>
					<div class="col-lg-5 col-md-5">
						<div id="groupMember" class="card">
							<div class="header">
								<div class="row">
									<div class="col-xs-9">
										<h4 class="title">Group Member</h4>
									</div>
									<div class="col-xs-3 text-right">
										<btn class="btn btn-sm btn-info btn-icon">
										<i class="ti-plus"></i> Add</btn>
									</div>
								</div>
							</div>
							<div class="content">
								<ul class="list-unstyled team-members">
									<li>
										<div class="row">
											<div class="col-xs-3">
												<div class="avatar">
													<img src="/resources/assets/img/faces/face-0.jpg"
														alt="Circle Image"
														class="img-circle img-no-padding img-responsive">
												</div>
											</div>
											<div class="col-xs-6">
												<span>아무개1</span><i class="group-leader fa ti-crown"></i>
												<br /> <span class="text-muted"><small>Not a
														service user</small></span>
											</div>

											<div class="col-xs-3 text-right">
												<btn class="btn btn-sm btn-danger btn-icon">
												<i class="fa ti-close"></i></btn>
											</div>
										</div>
									</li>
									<li>
										<div class="row">
											<div class="col-xs-3">
												<div class="avatar">
													<img src="/resources/assets/img/faces/face-1.jpg"
														alt="Circle Image"
														class="img-circle img-no-padding img-responsive">
												</div>
											</div>
											<div class="col-xs-6">
												<span>아무개2</span> <br /> <span class="text-success"><small>Service
														user</small></span>
											</div>

											<div class="col-xs-3 text-right">
												<btn class="btn btn-sm btn-danger btn-icon">
												<i class="fa ti-close"></i></btn>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>

<form id='actionForm' method="get"></form>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script src="/resources/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="/resources/sweetalert2/dist/sweetalert2.min.js"></script>
<script type="text/javascript" src="/resources/js/ip.js"></script>
<script type="text/javascript">

	var actionForm = $("#actionForm");

	$("#groupList").on("click", ".moreBtn", function() {
		$("#groupMember").hide('slow');
		
	});
	$('body').on("click", "#excelSubmit", function (e) {
		e.preventDefault();
		
		
		var formData = new FormData();  
		
        formData.append("file", $("#excelFile")[0].files[0]);
		$.ajax({
            url : IP + 'group/excelUpload',
            data : formData,
            dataType : 'text',
            processData : false, 
            contentType : false,
            type : 'POST',
            success : function(returnData) {
            	swal({
          		  position: 'center',
          		  type: 'success',
          		  title: 'Your work has been saved',
          		  showConfirmButton: false,
          		  timer: 1000
          		})
            }
        });
    });
	$("#exceldownBtn").click(function(e){
		var fileName = "group.xlsx";
		actionForm.attr("action", IP+"bansang/download/" + fileName).submit();
	});
	$("#excelupBtn").click(function(e){
		e.preventDefault();
		swal({
			  title: '<i>Group Register</i>',
			  html:
				  "<form id='fileForm'>"+
				  "<br><input class='sw-center' type='file' name='excelFile' id='excelFile'/> "+
				  "</form>",
			  showCloseButton: true,
			  showCancelButton: true,
			  focusConfirm: false,
			  confirmButtonText:
			    'Register',
			  cancelButtonText:
			  'Cancel',
			  
		}).then((result) => {
			  if (result.value) {
				  var formData = new FormData();  
				  formData.append("file", $("#excelFile")[0].files[0]);
				  
				  
				  $.ajax({
					  url : IP + 'group/excelUpload',
					  data : formData,
					  dataType : 'text',
					  processData : false, 
					  contentType : false,
					  type : 'POST',
					  success : function(returnData) {
						  swal({
			              	position: 'center',
			            	type: 'success',
			            	title: 'Your work has been saved',
			            	showConfirmButton: false,
			            	timer: 1000
			              })
					  }
				  });
			  }
			})
	})
	

	

	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

