<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<link rel="stylesheet" href="/resources/assets/css/store-management.css" />

<style>
#searchBtn {
	background-color: #EB5E28;
	border-color: #EB5E28
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
			<div class="box">
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example1_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-6">
								<div id="example1_filter" class="dataTables_filter">
									<select name="searchType">
										<option value="n"
											<c:out value="${cri.searchType == null?'selected':''}"/>>
											Search Type</option>
										<option value="s"
											<c:out value="${cri.searchType eq 's'?'selected':''}"/>>
											Store Name</option>
										<option value="a"
											<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
											Area Keyword</option>
									</select> <input type="text" class="form-control input-sm"
										name="keyword" id="keywordInput" placeholder="search"
										aria-controls="example1" value="${cri.keyword}"> <a
										href="#" data-oper="list" class="btn btn-info btn-fill btn-wd"
										id="searchBtn">Search</a>
								</div>



							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table id="example1"
									class="table table-bordered table-striped dataTable"
									role="grid" aria-describedby="example1_info">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending"
												style="width: 297px;">Area</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending"
												style="width: 361px;">Store Name</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending"
												style="width: 322px;">Address</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${list}">
											<tr role="row" class="odd">
												<td class="sorting_1">${list.areaKeyword}</td>
												<td><a
													href='/bansang/storeModify?storeNumber=${list.storeNumber}&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}'>${list.storeName}</a></td>
												<td>${list.storeAddress }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="example1_info" role="status"
									aria-live="polite"><!-- Showing 1 to 10 of 57 entries --></div>
							</div>
							<div class="col-sm-7">
								<div class="dataTables_paginate paging_simple_numbers"
									id="example1_paginate">
									<ul class="pagination">
										<!-- <li class="paginate_button previous disabled"
											id="example1_previous">
											<a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Prev</a></li>
										<li class="paginate_button active"><a href="#"
											aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="example1" data-dt-idx="2" tabindex="0">2</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="example1" data-dt-idx="3" tabindex="0">3</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="example1" data-dt-idx="4" tabindex="0">4</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="example1" data-dt-idx="5" tabindex="0">5</a></li>
										<li class="paginate_button "><a href="#"
											aria-controls="example1" data-dt-idx="6" tabindex="0">6</a></li>
										<li class="paginate_button next" id="example1_next"><a
											href="#" aria-controls="example1" data-dt-idx="7"
											tabindex="0">Next<-/a></li> -->
									</ul>
								</div>
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

<!-- jQuery 3 -->
<!-- <script src="bower_components/jquery/dist/jquery.min.js"></script> -->
<!-- Bootstrap 3.3.7 -->
<!-- <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script> -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/assets/js/store-management.js"></script>
<script src="/resources/js/pagination.js"></script>

<script>
/* --------------pagination---------------- */
 
			$(".pagination").on("click", "li", function(e){
			    e.preventDefault();
			    var pageNum = $(this).attr('data-page');
			    var searchType = $("select[name='searchType']").val();
			    var keyword = $("input[name='keyword']").val();
			
			    
			    if($(this).attr('data-page') !== 'none'){
			    	if(searchType !== null && searchType !== 'n' && keyword !== null){
				    self.location="/bansang/storeManagement?page=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword;
				    return;
				    }
			    	self.location="/bansang/storeManagement?page=" + pageNum;
			    	}
			    });
			
			var pageStr = makePage({
			    total : ${cri.total},
			    current : ${cri.page},
			    pageSize : 10,
			    liCount : 10
			});
			
			$(".pagination").html(pageStr);

/* ------------------------------ */

			var msg = '${result}';
			if (msg === 'regsuccess') {
			    alert("작업 완료");
			}else if(msg === 'delsuccess'){
			    alert("삭제 완료");
			}
			
	/* 검색처리 */
         $("#searchBtn").on("click",function(e){
            var actionForm = $("#actionForm");
            var searchType = $("select[name='searchType']").val();
            var keyword = $("input[name='keyword']").val();
            
            if(searchType === null || searchType === 'n'){
                alert("검색 분류를 설정하세요!");
                return;
            }
            if(keyword.length === 0){
                alert("검색 키워드를 입력하세요!");
                return;
            }
            var str = '';
            str += "<input type='hidden' name='searchType' value='"+searchType+"'>";
            str += "<input type='hidden' name='keyword' value='"+keyword+"'>";
            actionForm.append(str);
            actionForm.submit();
        });

</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

