<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="file-form">
		<input type="text" id="group-name" name="groupName">
		<input type="file" id="excel-file" name="file">
		<input type="submit">
	</form>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js";
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>       
	<script>
	$(document).ready(function() {
		
		console.log("ready");
	    $("#file-form").on("submit", function(event) {
	        
	        event.preventDefault();
	        console.log("clicked....");
	        
	        var formData = new FormData();  
	
	        formData.append("file", $("#excel-file")[0].files[0]);
	        formData.append("groupName", $("#group-name")[0]);
	        
	        console.log("groupName: " + $("#group-name")[0]);
	
	        $.ajax({
	            url : '/bansang/register',
	            data : formData,
	            dataType : 'text',
	            processData : false, 
	            contentType : false,
	            type : 'POST',
	            success : function(returnData) {
	                alert(returnData);
	            }
	        });
	    });
	});
	</script>
</body>
</html>