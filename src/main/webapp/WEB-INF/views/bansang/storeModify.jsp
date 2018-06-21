<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd";>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href="/resources/sweetalert2/dist/sweetalert2.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
	height: 80%;
	box-sizing: border-box;
	padding: 10px 0;
}

.gallery-thumbs .swiper-slide {
	width: 65%;
	height: 100%;
	opacity: 0.4;
}

.gallery-thumbs .swiper-slide-active {
	opacity: 1;
	width: 65%;
}

.gallery-thumbs {
	height: 100%
}

.swal2-popup .swal2-close {
	display: none;
	color: #fff;
}

#button {
	background-color: #ffffff;
	border-color: #EB5E28;
	color: #EB5E28;
}

#cancelBtn {
	width: 15%;
	height: auto;
	z-index: 900;
	margin-left: -10%;
	margin-top: -44.5%;
}

#medal {
	z-index: 1000;
	margin-top: -52%;
	margin-right: 46.5%;
	margin-left: -6%;
	width: 23%;
}

.show {
	border: solid 7px #fd5d5e;
}

.hide {
	display: none;
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
							<p class="user-info">${userSession.memberName}님</p>
					</a></li>
					
					<li><a href="/logout"> <i class="ti-shift-left"> </i>
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
											<div class="col-md-9">
												<div id="position">
													<div class="form-group" style="margin-top: 5em;">
														<label>StoreName</label> 
														<input type="text"class="form-control border-input" readonly="readonly"
															value="${info.storeName}">
													</div>
												</div>
												<div class="form-group">
													<label>Store Address</label> 
													<input type="text"class="form-control border-input" readonly="readonly"
														value="${info.storeAddress}">
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<label class="pull-left" style="margin-left: 20px;">Image</label>
													<div class="form-group" style="margin-right: 2em;">
														<a href="#" id="addBtn"> <img
															src="/resources/img/plus1.png" class="pull-right"
															style="margin-left: 10px;"></a>
														<a href="#" id="MainBtn"><img class="pull-right" src="/resources/img/medal2.png"></a>
														<div class="swiper-container">
															<div class="swiper-container gallery-thumbs">
																<div class="swiper-wrapper" style="width: 50%"></div>
																<span class="swiper-button-next swiper-button-black"></span>
																<span class="swiper-button-prev swiper-button-black"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-md-6 pull-right" style="margin-right: 2em;">
											
												<input type='hidden' name='storeNumber' value='${info.storeNumber}'> 
												<input type='hidden' name='storePage' value='${cri.page}'> 
												<input type='hidden' name='searchType' value='${cri.searchType}'>
												<input type='hidden' name='keyword' value='${cri.keyword}'>

												<a href="#" data-oper="can" class="btn pull-right"
													style="margin-left: 7px">취소</a> 
												<a href="#" data-oper="mod"
													class="btn btn-success pull-right" style="margin-left: 7px">수정</a>
												<a href="#" data-oper="del" class="btn btn-info pull-right"
													style="margin-left: 7px">삭제</a>
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
<script src="/resources/js/swiper.js"></script>

<script>
	
	/*--------------------------swiper event---------------------------*/
	
	var imageIdx = 0;
	
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
	
	/* --------------------crawling image-------------------- */	

	function getStoreImages() {
		
		var storeNumber =  ${info.storeNumber}
	
        $.getJSON(IP + 'upload/storeImages/'+ storeNumber , function (arr) {  
        	
            for(var i = 0; i < arr.length; i++){
            	
				/* var str = "<img class='swiper-slide' src='"+ IP + "upload/thumbImages/" + arr[i] +"'>"; */
				var top = "<div class='swiper-slide'><img class='swiper-slide' id='top' src='"
				+ IP + "upload/storeShow/s_" 
				+ arr[i] +"'></div>";
				
				var thumbs = "<div class='swiper-slide' id='main'><img id='mark' data-name='" 
				+ arr[i] + "'class='swiper-slide-active' src='"
				+ IP + "upload/storeShow/s_" +arr[i] +"'><img data-ino='"+ (imageIdx++) +"' id='cancelBtn' class='canBtn' src='/resources/img/cancel-button.png'></div>";
				
				var mainImage = "${info.imageName}";
				
				galleryTop.appendSlide(top);
				galleryThumbs.appendSlide(thumbs);
								
				if(arr[i] === mainImage){
					$("#mark[data-name='"+arr[i]+"']").siblings().addClass('hide');
					$("#mark[data-name='"+arr[i]+"']").addClass('show');
				}
            };
           
            
        });
        
    }
	getStoreImages();
	
	/*-------------------------image upload--------------------------- */
	
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
					  url : IP + 'upload/storeRegister',
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
							
							var top = "<div class='swiper-slide'><img class='swiper-slide' id='top' src='"
							+ IP + "upload/storeShow/" + obj.thumbnailName +"'></div>";
							
							var thumbs = "<div class='swiper-slide'><img id='mark' data-name='" + obj.uploadName + "' class='swiper-slide-active' src='"
							+ IP + "upload/storeShow/" + obj.thumbnailName +"'><img data-ino='" + (imageIdx++) + "'id='cancelBtn' class='canBtn' src='/resources/img/cancel-button.png'></div>";
					
							galleryTop.appendSlide(top);
							galleryThumbs.appendSlide(thumbs);
							
					  }
			  
				  }); 
			  }
			});
	});
	
	/*--------------------------image delete---------------------------  */
	

    $('.gallery-thumbs').on('click','.canBtn' ,function () {
         
         var deleteIno = $(this).attr("data-ino"); 
         
         var idx;
         $(".canBtn").each(function(index){
             
             idx = $(this).attr("data-ino");
             
             if(idx == deleteIno){
                 galleryThumbs.removeSlide(index);
                 galleryTop.removeSlide(index);
                 return false;
             }          
         });
   });

	 	var deleteIno = $(this).attr("data-ino"); 
	 	
	 	var idx;
	 	$(".canBtn").each(function(index){
	 		
	 		idx = $(this).attr("data-ino");
	 		
	 		if(idx == deleteIno){
	 	    	galleryThumbs.removeSlide(index);
	 			galleryTop.removeSlide(index);
	 			return false;
	 		}	
	 	});
	 	
	/*--------------------------buttno(delete, update, cancel)---------------------------*/

	var actionForm = $("#actionForm");
	var modForm = $("#modForm");
	
	$(".btn").click(function(e) {
		e.preventDefault();
	});

	/* 삭제 */
 	$(".btn[data-oper='del']").click(function(e) {
						actionForm.append("<input type='hidden' name='storeNumber' value='${info.storeNumber}'>");
						actionForm.append("<input type='hidden' name='storePage' value='${cri.page}'>");
						actionForm.append("<input type='hidden' name='searchType' value='${cri.searchType}'>");
						actionForm.append("<input type='hidden' name='keyword' value='${cri.keyword}'>");
						actionForm.attr("method", "post").attr("action", "/bansang/remove").submit();
					}); 
					

	/* 취소 */
	$(".btn[data-oper='can']").click(function(e) {
		actionForm.append("<input type='hidden' name='page' value='${cri.page}'>");
		actionForm.append("<input type='hidden' name='searchType' value='${cri.searchType}'>");
		actionForm.append("<input type='hidden' name='keyword' value='${cri.keyword}'>");
		actionForm.attr("action", "/bansang/storeManagement").submit();
	});
	

	/*  수정(Update) */
	$(".btn[data-oper='mod']").click(function(e) {
		$("img[class*='swiper-slide-active']").each(function(index){
			console.log($(this).attr('data-name'));
			modForm.append("<input type='hidden' name='images' value='" + $(this).attr('data-name') + "'>");
	 	});
		modForm.append("<input type='hidden' name='imageName' value='" + $("#mark[class*='show']").attr('data-name') + "'>");
		modForm.attr("action", "/bansang/storeModify").submit();
	});
	
	/* mainImage */
	
	$("#MainBtn").click(function(e) {
		
		e.preventDefault();
		//console.log($("div[class *= 'gallery-thumbs']"));
		//console.log($("div[class *= 'gallery-thumbs'] div[class *= 'swiper-slide-active']")); 
		var selectedMainImage = $("div[class *= 'gallery-thumbs'] div[class *= 'swiper-slide-active'] #mark");
		console.log($("#medal[class*='show']"));
		$("#mark[class*='show']").siblings().removeClass('hide')
		$("#mark[class*='show']").removeClass("show");
		
		console.log(selectedMainImage);
 		selectedMainImage.addClass('show');
 		selectedMainImage.siblings().addClass('hide');
 		
 		swal({
 			  position: 'center',
 			  type: 'success',
 			  title: 'Image Completed.',
 			  showConfirmButton: false,
 			  timer: 1500
 			});
 		
	});
	
	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>