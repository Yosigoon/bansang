<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="wrapper">
	<div class="sidebar" data-background-color="white"
		data-active-color="danger">
		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="#" class="simple-text">동네반상</a>
			</div>

			<ul class="nav">
				<li class="active"><a href="/bansang/profile"> <i
						class="ti-user"></i>
						<p>User Profile</p>
				</a></li>
				<li><a href="/bansang/group"> <i class="ti-view-list-alt"></i>
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
				<a class="navbar-brand" href="#">User Profile</a>
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
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="content">
								<div class="row">
									<div class="col-xs-5">
										<div class="icon-big icon-warning text-center">
											<i class="ti-server"></i>
										</div>
									</div>
									<div class="col-xs-7">
										<div class="numbers">
											<p>Capacity</p>
											105GB
										</div>
									</div>
								</div>
								<div class="footer">
									<hr />
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="content">
								<div class="row">
									<div class="col-xs-5">
										<div class="icon-big icon-success text-center">
											<i class="ti-wallet"></i>
										</div>
									</div>
									<div class="col-xs-7">
										<div class="numbers">
											<p>Revenue</p>
											$1,345
										</div>
									</div>
								</div>
								<div class="footer">
									<hr />
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="content">
								<div class="row">
									<div class="col-xs-5">
										<div class="icon-big icon-danger text-center">
											<i class="ti-pulse"></i>
										</div>
									</div>
									<div class="col-xs-7">
										<div class="numbers">
											<p>Errors</p>
											23
										</div>
									</div>
								</div>
								<div class="footer">
									<hr />
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card">
							<div class="content">
								<div class="row">
									<div class="col-xs-5">
										<div class="icon-big icon-info text-center">
											<i class="ti-twitter-alt"></i>
										</div>
									</div>
									<div class="col-xs-7">
										<div class="numbers">
											<p>Followers</p>
											+45
										</div>
									</div>
								</div>
								<div class="footer">
									<hr />
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-4 col-md-5">
						<div class="card card-user">
							<div class="image">
								<img src="/resources/assets/img/background.jpg" alt="..." />
							</div>
							<div class="content">
								<div class="author">
									<img class="avatar border-white"
										src="/resources/assets/img/faces/face-2.jpg" alt="..." />
									<h4 class="title">
										현승우<br />
									</h4>
								</div>
								<p class="description text-center">
									"I like the way you work it <br> No diggity <br> I
									wanna bag it up"
								</p>
							</div>
							<hr>
							<div class="text-center">
								<div class="row">
									<div class="col-md-3 col-md-offset-1">
										<h5>서울</h5>
									</div>
									<div class="col-md-4">
										<h5>세종</h5>
									</div>
									<div class="col-md-3"></div>

								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8 col-md-7">
						<div class="card">
							<div class="header">
								<h4 class="title">Edit Profile</h4>
							</div>
							<div class="content">
								<form>
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label>Email</label> <input type="text"
													class="form-control border-input" disabled
													placeholder="Company" value="Creative Code Inc.">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label>Password</label> <input type="text"
													class="form-control border-input" placeholder="Password">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label>User Name</label> <input type="text"
													class="form-control border-input" placeholder="이름"
													value="현승우">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>지역1</label> <input type="text"
													class="form-control border-input" placeholder="지역 추가:)"
													value="서울">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>지역2</label> <input type="text"
													class="form-control border-input" placeholder="지역 추가:)"
													value="세종">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>지역3</label> <input type="text"
													class="form-control border-input" placeholder="지역 추가:)">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>About Me</label>
												<textarea rows="5" class="form-control border-input"
													placeholder="Here can be your description">
Oh so, your weak rhyme
You doubt I'll bother, reading into it
I'll probably won't, left to my own devices
But that's the difference in our opinions.
												</textarea>
											</div>
										</div>
									</div>
									<div class="text-center">
										<button type="submit" class="btn btn-info btn-fill btn-wd">Update
											Profile</button>
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

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

