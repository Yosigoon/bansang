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

#groupNameModBtn{
	cursor : pointer;
	padding-left : 0.2em;
}
.hide{
	display : none;
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
							<p class="user-info">${userSession.memberName}님</p>
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
						<div class="card">
							<div class="header">
								<div class="row">
									<div class="col-xs-9">
										<h4 class="title">Group List</h4>
										<p class="category">Make a lot of your group</p>
									</div>
									<div class="col-xs-3 text-right">
										<btn class="dropdown btn btn-sm btn-success btn-icon">
				                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
													Excel File <b class="caret"></b>
				                              </a>
				                              <ul class="dropdown-menu">
				                                <li id="exceldownBtn"><a href="#"><i class="ti-download"></i> Download</a></li>
				                                <li id="excelupBtn"><a href="#"><i class="ti-plus"></i> Register</a></li>
				                              </ul>
				                        </btn>
									
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
									<tbody id="groupListTable">
										
									</tbody>
								</table>


							</div>

						</div>
					</div>
					<div id="groupMemberDiv" class="col-lg-5 col-md-5">
						<div class="card">
							<div id="groupMemberHeaderDiv" class="header">
								
							</div>
							<div class="content">
								<ul id="groupMemberListUl"class="list-unstyled team-members">
									
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
<script type="text/javascript" src="/resources/js/ip.js?ver=2"></script>
<script type="text/javascript" src="/resources/js/handlebars.min.js"></script>


<script id="groupListTemplate" type="text/x-handlebars-template">
    {{#each .}}
    <tr>
  		<td>{{index}}</td>
  		<td>{{groupName}}</td>
  		<td>{{groupLeaderName}}</td>
  		<td>{{groupMemberCount}}</td>
  		<td><btn data-name="{{groupName}}" data-leader="{{groupLeader}}" data-gno="{{groupNumber}}" class="moreBtn btn btn-sm btn-primary btn-icon"><i class="fa ti-list"></i></btn></td>
	</tr>
    {{/each}}
</script>


<script id="groupMemberHeaderTemplate" type="text/x-handlebars-template">
	{{#each .}}    
	<div class="row">
		<div class="col-xs-9">
			<h4 class="title"><span id="groupName">{{groupName}} </span>
				{{#if isGroupLeader}}
					<i data-gno="{{groupNumber}}" id="groupNameModBtn" class="fa ti-pencil-alt"></i>
				{{/if}}
			</h4>
		</div>
		<div class="col-xs-3 text-right">
			{{#if isGroupLeader}}
    			<btn id="addMemberBtn" data-gno="{{groupNumber}}" data-gname="{{groupName}}" data-leader="{{groupLeader}}" class="btn btn-sm btn-info btn-icon">
				<i class="ti-plus"></i> Add</btn>
			{{else}}
				<btn id="leaveBtn" data-gno="{{groupNumber}}" data-id="{{memberId}}" class="btn btn-sm btn-danger btn-icon">
				 Leave</btn>
  			{{/if}}
			
		</div>
	</div>
	{{/each}}
</script>


<script id="groupLeaderTemplate" type="text/x-handlebars-template">
	{{#each .}}     
	<li>
  		<div class="row">
    		<div class="col-xs-3">
      			<div class="avatar">
        			<img src="{{imageURL}}" alt="Circle Image" class="img-circle img-no-padding img-responsive">
      			</div>
    		</div>
    		<div class="col-xs-6">
      			<span>{{memberName}}</span><i class="group-leader fa ti-crown"></i>
      			{{#if membership}}
    				<br/> <span class="text-success"><small>Service User</small></span>
				{{else}}
					<br/> <span class="text-muted"><small>Not a Service User</small></span>
  				{{/if}}
    		</div>
    		<div class="col-xs-3 text-right">
				{{#if isUser}}
      				<btn id="destroyBtn" data-gno="{{groupNumber}}" class="btn btn-sm btn-danger btn-icon"><i class="group-leader fa ti-rocket"></i> Destroy</btn>
				{{/if}}
    		</div>
  		</div>
	</li>
	{{/each}}
</script>
<script id="groupMemberListTemplate" type="text/x-handlebars-template">
    {{#each .}}
    <li>
  		<div class="row">
    		<div class="col-xs-3">
      			<div class="avatar">
        			<img src="{{imageURL}}" alt="Circle Image" class="img-circle img-no-padding img-responsive">
      			</div>
    		</div>
    		<div class="col-xs-6">
      			<span>{{memberName}}</span>
				{{#if membership}}
    				<br/> <span class="text-success"><small>Service User</small></span>
				{{else}}
					<br/> <span class="text-muted"><small>Not a Service User</small></span>
  				{{/if}}
      			
    		</div>
			{{#if isGroupLeader}}
    		<div class="col-xs-3 text-right">
      			<btn id="dismissBtn" data-gno="{{groupNumber}}" data-id="{{memberId}}" class="btn btn-sm btn-danger btn-icon"> <i class="fa ti-close"></i></btn>
    		</div>
			{{/if}}
  		</div>
	</li>
    {{/each}}
</script>

            
<script type="text/javascript">
	var memberId = '${userSession.memberId}';
	var actionForm = $("#actionForm");

	
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
		e.preventDefault();
		var fileName = "group.xlsx";
		actionForm.attr("action", IP+"bansang/download/" + fileName).submit();
	});
	$("#excelupBtn").click(function(e){
		e.preventDefault();
		swal({
			  title: 'Group Register',
			  html:
				  "<form id='fileForm'>"+
				  "<br><input class='sw-center' type='file' name='excelFile' id='excelFile'/> "+
				  "</form>",
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
			              getGroup();
					  }
				  });
			  }
			})
	})
	$('#groupMemberHeaderDiv').on("click", "#groupNameModBtn", function (e) {
		e.preventDefault();
		var groupName = $("#groupName").html();
		var groupNumber = $(this).attr("data-gno");
		swal({
			  title: 'Group Name Modify',
			  html:
				  "<br><input type='text' name='groupName' id='groupNameInput' value='"+ groupName +"'/> ",
			  showCancelButton: true,
			  focusConfirm: false,
			  confirmButtonText:
			    'Modfiy',
			  cancelButtonText:
			  'Cancel',
			  
		}).then((result) => {
			  if (result.value) {
				var groupName = $("#groupNameInput").val();
				  
				var data = {
					groupNumber : groupNumber,	  
					groupName: groupName
				};

	          	$.ajax({
		            url: IP + "group/groupNameMod" ,
		            type: 'PUT',
		            contentType: 'application/json; charset=utf-8',
		            data:JSON.stringify(data),
		            success: function (result) {
		                swal({
		                    position: 'center',
		                    type: 'success',
		                    title: 'Thank You!',
		                    showConfirmButton: false,
		                    timer: 1500
		                })
		                getGroup();
		                $("#groupName").html(groupName);
		            }
		        })
				  
			  }
			})
	})
	
	
	function getGroup() {
		var source = $('#groupListTemplate').html();
		var groupListTemplate = Handlebars.compile(source);
		var data = [];
		
		
		$.getJSON(IP + "/group/groupList/?memberId="+ memberId , function (arr) {
			
            for(var i = 0; i < arr.length; i++){
            	   
           	 	data.push({
                    index: (i+1),
                    groupName : arr[i].groupName,
                    groupLeaderName : arr[i].groupLeaderName,
                    groupMemberCount : arr[i].groupMemberCount,
                    groupLeader : arr[i].groupLeader,
                    groupNumber : arr[i].groupNumber
                });
            };
            $('#groupListTable').html(groupListTemplate(data));
        });
    };
    getGroup();
    
    
    
    
    function getGroupMemberList(groupNumber, groupLeader, groupName) {
    	
    	// ========================= Group Header Start 
    	var isGroupLeader = false;
    	if(groupLeader === memberId){
    		isGroupLeader = true;
    	}
    	
    	var headerSource = $("#groupMemberHeaderTemplate").html();
    	var groupMemberHeaderTemplate = Handlebars.compile(headerSource);
		var headerData = [];
    	
		headerData.push({
			groupName : groupName,
			isGroupLeader : isGroupLeader,
			groupNumber : groupNumber,
			memberId : memberId,
			groupLeader : groupLeader
        });
		$('#groupMemberHeaderDiv').append(groupMemberHeaderTemplate(headerData));
		
		// ========================== Group Header End
		
		var leaderSource = $('#groupLeaderTemplate').html();
		var groupLeaderTemplate = Handlebars.compile(leaderSource);
		var leaderData = [];
		
		var memberSource = $('#groupMemberListTemplate').html();
		var groupMemberListTemplate = Handlebars.compile(memberSource);
		var memberData = [];
		
		$.getJSON(IP + "/group/groupMemberList/"+ groupNumber , function (arr) {
            for(var i = 0; i < arr.length; i++){
            	///////////////////// 현재 사용자 여부 ///////////
            	var isUser = false;
            	if(arr[i].memberId === memberId){
            		isUser = true;
            	}
            	
            	///////////////////////////////////////////////
            	
            	///////////////////// 서비스 사용 여부 ////////////
            	var membership = false; // 그룹원, 리더 동일 적용    	
            	if(arr[i].membership === "y"){
            		membership = true;
            	}
				///////////////////////////////////////////////
				
				
				///////////////////// 프로필 이미지 처리 ////////////
            	if(arr[i].imageName === null){ // 그룹원, 리더 동일 적용
            		arr[i].imageName = "basic.jpg";
            	}
            	var imageURL = IP + "upload/profileImage/" + arr[i].imageName;
				///////////////////////////////////////////////
				
				
				///////////////////// 그룹 리더 및 멤버 처리 ////////////
            	if(arr[i].memberId === groupLeader){ // 그룹 리더인 경우
            		leaderData.push({
            			imageURL : imageURL,
                        memberName : arr[i].memberName,
                        membership : membership,
                        isUser : isUser,
                        groupNumber: groupNumber
                    });
            	}else{ // 일반 그룹원인 경우
            		memberData.push({
            			imageURL : imageURL,
                        memberName : arr[i].memberName,
                        membership : membership,
                        isGroupLeader : isGroupLeader,
                        groupNumber : groupNumber,
                        memberId : arr[i].memberId
                    });
            	}
				///////////////////////////////////////////////
            };
            
            $('#groupMemberListUl').append(groupLeaderTemplate(leaderData)); // 리더를 먼저 넣고
            $('#groupMemberListUl').append(groupMemberListTemplate(memberData)); // 일반 그룹원을 넣는다.
            
        });
    };
    
    
    
    $("#groupListTable").on("click", ".moreBtn", function(e) {
    	$('#groupMemberDiv').hide();
    	$('#groupMemberHeaderDiv').html("");
		$("#groupMemberListUl").html("");
		var $this = $(this);
		var groupNumber = $this.attr("data-gno");
		var groupLeader = $this.attr("data-leader");
		var groupName = $this.attr("data-name");
		getGroupMemberList(groupNumber, groupLeader, groupName);
		$('#groupMemberDiv').show("slow");
		
	});
    
    $("#groupMemberListUl").on("click", "#dismissBtn", function(e) {
    	swal({
    		  title: 'Are you sure?',
    		  text: "You won't be able to revert this!",
    		  type: 'warning',
    		  showCancelButton: true,
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: 'Yes!'
    		}).then((result) => {
    		  if (result.value) {
    		    var $this = $(this);
    			var groupNumber = $this.attr("data-gno");
    			var memberId = $this.attr("data-id");
    			var data = {
    				memberId : memberId	
    			}
    			$.ajax({
    		   		url: IP + "group/dismissMember/" + groupNumber,
    		            type: 'DELETE',
    		            contentType: 'application/json; charset=utf-8',
    		            data:JSON.stringify(data),
    		            success: function (result) {
    		            	
    		            	swal(
    		          		      'Deleted!',
    		          		      'Your file has been deleted.',
    		          		      'success'
    		          		)
    		          		getGroup();
    		          		$this.parent().parent().parent().remove();
    		            }
    		     })   
    		  }
    	})

	});
    $("#groupMemberListUl").on("click", "#destroyBtn", function(e) {
    	swal({
  		  title: 'Are you sure?',
  		  text: "You won't be able to revert this!",
  		  type: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Yes!'
  		}).then((result) => {
  		  if (result.value) {
  		    var $this = $(this);
  			var groupNumber = $this.attr("data-gno");
  			$.ajax({
  		   		url: IP + "group/destroyGroup/" + groupNumber,
  		            type: 'DELETE',
  		            contentType: 'application/json; charset=utf-8',
  		            success: function (result) {
  		            	
  		            	swal(
  		          		      'Deleted!',
  		          		      'Your file has been deleted.',
  		          		      'success'
  		          		)
  		          		$('#groupMemberDiv').hide();
  		          		getGroup();
  		          		
  		            }
  		     })   
  		  }
  		})
    });
    
    
    $("#groupMemberHeaderDiv").on("click", "#leaveBtn", function(e) {
    	swal({
  		  title: 'Are you sure?',
  		  text: "You won't be able to revert this!",
  		  type: 'warning',
  		  showCancelButton: true,
  		  confirmButtonColor: '#3085d6',
  		  cancelButtonColor: '#d33',
  		  confirmButtonText: 'Yes!'
  		}).then((result) => {
  		  if (result.value) {
  		    var $this = $(this);
  			var groupNumber = $this.attr("data-gno");
  			var memberId = $this.attr("data-id");
  			
  			var data = {
  					groupNumber : groupNumber,
    				memberId : memberId	
    		}
  			
  			$.ajax({
  		   		url: IP + "group/leaveGroup",
  		        type: 'DELETE',
  		        contentType: 'application/json; charset=utf-8',
  		      	data:JSON.stringify(data),
  		        success: function (result) {
  		            	swal(
  		          		      'Deleted!',
  		          		      'Your file has been deleted.',
  		          		      'success'
  		          		)
  		          		$('#groupMemberDiv').hide();
  		          		getGroup();
  		            }
  		     })   
  		  }
  		})
    });
    
    $("#groupMemberHeaderDiv").on("click", "#addMemberBtn", function(e) {
    	swal({
    		  html: "E-mail : <input id='plusMemberId' name='memberId'><br><br>" +
    		  		"Name : <input id='plusMemberName' name='memberName'>",
    		  showCancelButton: true,
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: 'Register',
    		  cancelButtonText: 'Cancel',
    		  confirmButtonClass: 'btn btn-success',
    		  cancelButtonClass: 'btn btn-danger',
    		}).then((result) => {
    		  if (result.value) {
    			  
    			  	var groupNumber = $(this).attr('data-gno');
    			  	var groupLeader = $(this).attr('data-leader');
  		        	var groupName = $(this).attr('data-gname');
  		        	
    				var data = {
    	  				groupNumber : groupNumber,
    	    			memberId : $('#plusMemberId').val(),
    	    			memberName : $('#plusMemberName').val()
    	    		}
    	  			
    	  			$.ajax({
    	  		   		url: IP + "group/addGroupMember",
    	  		        type: 'POST',
    	  		        contentType: 'application/json; charset=utf-8',
    	  		      	data:JSON.stringify(data),
    	  		        success: function (result) {
    	  		        	swal(
    	  		    		      'Thank you!',
    	  		    		      'A new member has been registered.',
    	  		    		      'success'
    	  		    		)
    	  		    		
    	  		        	$('#groupMemberHeaderDiv').html("");
    	  		        	$('#groupMemberListUl').html("");
    	  		        	getGroupMemberList(groupNumber, groupLeader, groupName);
    	  		          	getGroup();
    	  		         }
    	  		     })  
    		}
    	})
    });
	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

