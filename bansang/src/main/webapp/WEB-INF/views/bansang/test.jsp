<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd";>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href="/resources/sweetalert2/dist/sweetalert2.min.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="/resources/css/swiper.css">
<style>
.swiper-container {
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	width: 100%;
	height: 100%;
	margin: 20px auto;
}

swiper-slide {
	background-size: cover;
	background-position: center;
}

.gallery-top {
	height: 100%;
	width: 100%;
}

.gallery-thumbs {
	height: 20%;
	box-sizing: border-box;
	padding: 10px 0;
}

.gallery-thumbs .swiper-slide {
	width: 25%;
	height: 100%;
	opacity: 0.4;
}

.gallery-thumbs .swiper-slide-active {
	opacity: 1;
}

.gallery-thumbs {
	height: 100%
}

#button {
	background-color: #ffffff;
	border-color: #EB5E28;
	color: #EB5E28;
}

/* +Add Style*/
.navbar .navbar-nav>li>a.btn-info, .btn-info {
	border-color: #EB5E28;
	color: #EB5E28;
}

.btn-info.active.focus, .btn-info.active:focus, .btn-info.active:hover,
	.btn-info:active.focus, .btn-info:active:focus, .btn-info:active:hover,
	.open>.dropdown-toggle.btn-info.focus, .open>.dropdown-toggle.btn-info:focus,
	.open>.dropdown-toggle.btn-info:hover {
	color: #fff;
	background-color: #EB5E28;
	border-color: #EB5E29;
}

.navbar .navbar-nav>li>a.btn-info:hover, .navbar .navbar-nav>li>a.btn-info:focus,
	.navbar .navbar-nav>li>a.btn-info:active, .navbar .navbar-nav>li>a.btn-info.active,
	.open>.navbar .navbar-nav>li>a.btn-info.dropdown-toggle, .btn-info:hover,
	.btn-info:focus, .btn-info:active, .btn-info.active, .open>.btn-info.dropdown-toggle
	{
	border-color: #EB5E28;
}

.navbar .navbar-nav>li>a.btn-info:hover, .navbar .navbar-nav>li>a.btn-info:focus,
	.navbar .navbar-nav>li>a.btn-info:active, .navbar .navbar-nav>li>a.btn-info.active,
	.open>.navbar .navbar-nav>li>a.btn-info.dropdown-toggle, .btn-info:hover,
	.btn-info:focus, .btn-info:active, .btn-info.active, .open>.btn-info.dropdown-toggle
	{
	background-color: #EB5E28;
	color: rgba(255, 255, 255, 0.7);
	border-color: #EB5E28;
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
				<li><a href="/bansang/profile"><i class="ti-user"></i>
						<p>User Profile</p> </a></li>
				<li><a href="/bansang/group"> <i class="ti-view-list-alt"></i>
						<p>Group</p>
				</a></li>
				<li class="active"><a href="/bansang/storeManagement"> <i
						class="ti-desktop"></i>
						<p>Store Management</p>
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
				<a class="navbar-brand" href="#">Store Management</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><i class="ti-user"> </i>
							<p class="user-info">홍길동</p> </a></li>
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
					<div class="col-md-8">
						<div class="card">
							<div class="header">
								<h4 class="title">Store Modify</h4>
							</div>
							<div class="content">
								<form id="modForm" method="post">
									<div class="row">
										<div class="col-md-6">
											<div class="swiper-container">
												<div class="swiper-container gallery-top">
													<div class="swiper-wrapper" style="width: 100%;"></div>
												</div>
											</div>

										</div>

										<div class="col-md-6">
											<div id="position">
												<div class="form-group" style="margin-top: 5em;">
													<label>StoreName</label> <input type="text"
														class="form-control border-input" readonly="readonly"
														value="${info.storeName}">
												</div>
												<div class="form-group">
													<label>Store Address</label> <input type="text"
														class="form-control border-input" readonly="readonly"
														value="${info.storeAddress}">
												</div>
											</div>
											<!--넣어보자 -->
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<!-- <label>Image</label> -->
														<a href="#" id="addBtn"
															class="btn btn-sm btn-info btn-icon pull-right"> <i
															class="ti-plus"></i> Add
														</a>

														<div class="swiper-container">
															<div class="swiper-container gallery-thumbs">
																<div class="swiper-wrapper" style="width: 50%"></div>

																<!-- Add Arrows -->
																<div class="swiper-button-next swiper-button"></div>
																<div class="swiper-button-prev swiper-button"></div>
																<!-- <div class="swiper-button-prev swiper-button-red"></div> -->
															</div>
														</div>


													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- thumb 있었던 자리  -->
									<div class="row">
										<div class="form-group">
											<div class="text-right" style="margin-right: 2em;">

												<input type='hidden' name='storeNumber'
													value='${info.storeNumber}'> <input type='hidden'
													name='storePage' value='${cri.page}'> <input
													type='hidden' name='searchType' value='${cri.searchType}'>
												<input type='hidden' name='keyword' value='${cri.keyword}'>


												<a href="#" data-oper="del" id="button"
													class="btn btn-info btn-fill btn-wd">Delete</a> <a href="#"
													class="btn btn-info btn-fill btn-wd" id="button">Update</a>

												<a href="#" data-oper="can" id="button"
													class="btn btn-info btn-fill btn-wd">Cancel</a>
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</form>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="/resources/sweetalert2/dist/sweetalert2.min.js"></script>
<script type="text/javascript" src="/resources/js/ip.js"></script>
<!--  -->
<script src="/resources/js/swiper.js"></script>
<script>

	/*--------------------------swiper 이벤트처리---------------------------*/
	
	var galleryTop = new Swiper('.gallery-top', {
	              		spaceBetween : 10,
	              		navigation : {
	              			nextEl : '.swiper-button-next',
	              			prevEl : '.swiper-button-prev',
	              		},
	              	});
	var galleryThumbs = new Swiper('.gallery-thumbs', {
	              		spaceBetween : 10,
	              		centeredSlides : true,
	              		slidesPerView : 'auto',
	              		touchRatio : 0.2,
	              		slideToClickedSlide : true,
	              	});
	              
	galleryTop.controller.control = galleryThumbs;
	galleryThumbs.controller.control = galleryTop;
	/* --------------------크롤링된 이미지 가져오기-------------------- */	
/* 	
<div class="swiper-container">
<div class="swiper-container gallery-thumbs">
<div class="swiper-wrapper" style="width: 50%"></div> */

	function getStoreImages() {
		
		var storeNumber =  ${info.storeNumber}
	
        $.getJSON(IP + 'upload/storeImages/'+ storeNumber , function (arr) {    	
        	
            for(var i = 0; i < arr.length; i++){
            	
				/* var str = "<img class='swiper-slide' src='"+ IP + "upload/thumbImages/" + arr[i] +"'>"; */
				var str = "<img src='"+ IP + "upload/thumbImages/" + arr[i] +"'>";
				galleryTop.appendSlide(str);
				galleryThumbs.appendSlide(str);
				$(".swiper-wrapper img").addClass("swiper-slide");
				
            };
            
        });
        
    }
	getStoreImages();
	
/* 	<div class="swiper-button-next swiper-button"></div>
	<div class="swiper-button-prev swiper-button"></div> */

	/*-------------------------이미지 업로드--------------------------- */
	
	$("#addBtn").click(function(e){
		e.preventDefault();
		swal({
			  title: '<i>Add image</i>',
			  html:
				  "<form id='fileForm'>"+
				  "<br><input class='sw-center' type='file' name='addFile' id='addFile'/> "+
				  "</form>",
			  showCloseButton: true,
			  showCancelButton: true,
			  focusConfirm: false,
			  confirmButtonText: 'Add',
			  cancelButtonText: 'Cancel',
			  
		}).then((result) => {
			  if (result.value) {
				  var formData = new FormData();  
				  formData.append("file", $("#addFile")[0].files[0]);
				  
				  
			  $.ajax({
					  url : IP + 'upload/register',
					  data : formData,
					  dataType : 'text',
					  processData : false, 
					  contentType : false,
					  type : 'POST',
					  success : function(data) {
						  swal({
			              	position: 'center',
			            	type: 'success',
			            	title: 'Your work has been saved',
			            	showConfirmButton: false,
			            	timer: 1000
			              });
							console.log(data);
							var obj = JSON.parse(data);
							console.log(obj.uploadName);
							var str = "<img src='"+ IP + "upload/show/" + obj.uploadName +"'>";
							galleryTop.appendSlide(str);
							galleryThumbs.appendSlide(str);
							$(".swiper-wrapper img").addClass("swiper-slide");
					  }
			  
				  }); 
			  }
			});
	});
	

	/*--------------------------버튼이벤트처리---------------------------*/

	var actionForm = $("#actionForm");
	$(".btn").click(function(e) {
		e.preventDefault();
	});

	/* 삭제 */
	$(".btn[data-oper='del']").click(function(e) {
						actionForm.append("<input type='hidden' name='storeNumber' value='${info.storeNumber}'><input type='hidden' name='storePage' value='${cri.page}'>");
						actionForm.attr("method", "post").attr("action", "/bansang/remove").submit();
					});

	/* 취소 */
	$(".btn[data-oper='can']").click(function(e) {
		actionForm.append("<input type='hidden' name='page' value='${cri.page}'>");
		actionForm.append("<input type='hidden' name='searchType' value='${cri.searchType}'>");
		actionForm.append("<input type='hidden' name='keyword' value='${cri.keyword}'>");
		actionForm.attr("action", "/bansang/storeManagement").submit();
	});
	

	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
