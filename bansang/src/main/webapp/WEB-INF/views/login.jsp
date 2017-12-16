<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="/resources/login/css/bootstrap.css">
  
  <link rel="stylesheet" href="/resources/login/css/font-awesome.css">
  
  <link rel="stylesheet" href="/resources/login/css/ionicons.css">
  
  <link rel="stylesheet" href="/resources/login/css/AdminLTE.css">
  
  <link rel="stylesheet" href="/resources/login/css/blue.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<title>Log In</title>
</head>
<body class="hold-transition login-page">

<style>
.center{
	text-align: center;
}

.logo{
	margin-bottom : 1em;
	width: 10em;
	height: 8em;
}

</style>
<div class="login-box">
  <div class="login-logo">
    <a href="/login"><b>동 네</b> 반 상</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
  <div class="center">
  	<img class="logo" src="/resources/login/img/logo.png">
  </div>
    <p class="login-box-msg">Have a happy time</p>

    <form action="/login" method="post">
      <div class="form-group has-feedback">
        <input name="memberId" type="email" class="form-control" placeholder="Email" value="user00@user00.com">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="memberPassword" type="password" class="form-control" placeholder="Password" value="0">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input name="auto" type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        
      </div>
    </form>



  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="/resources/login/js/jquery.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/login/js/bootstrap.js"></script>
<!-- iCheck -->
<script src="/resources/login/js/icheck.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>