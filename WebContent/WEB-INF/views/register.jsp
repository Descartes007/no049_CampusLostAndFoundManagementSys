<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>校园失物招领系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css"> 
</head>
<body>

 
    <form action="<%=path %>/UserServlet?method=registeAct" method="post" onSubmit="return tijiao(this)" id="loginForm" name="loginForm">
    <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>注册界面</h2>
       
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
          <input type="text" name="username" lay-verify="username" id="username"  placeholder="用户名" class="layui-input">
          <div><span id="msg" style="color:red;"></span></div>
        </div>
       
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="password" lay-verify="password" id="password" placeholder="密码" class="layui-input">
        </div>
       <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                  <input type="radio" name="sex" value="1" title="男" checked>
                  <input type="radio" name="sex" value="2" title="女">
                </div>
          </div>
                   
        <div class="layui-form-item">
         <!--  <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit">注 册</button> -->
         <button type="submit" id="registerUser" class="layui-btn layui-btn-fluid">注册</button>
        </div>
        
          <div class="layui-form-item">
 	<a href="LoginServlet?method=login" class="layui-btn layui-btn-fluid" >返回登陆</a>
  
  </div>
       
      </div>
    </div>
    
    

  </div>
		
	


<script src="<%=path %>/layui/layui.js"></script>
<script>

layui.use([ 'form','jquery','layer' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	  
	 $('#registerUser').click(function(){  
		  var $1 = $.trim($('#username').val());
		  var $2 = $.trim($("#password").val());
		  var reg_username=/^\w{3,20}$/;
		  var flag=reg_username.test($1);
		  
		  var reg_password=/^\w{6,20}$/;
		  var b=reg_password.test($2);
		  if(flag){
				$("#username").css("border","");
				//return true;
	  		}else{
			layer.msg('用户名至少3位',function() {time:2000}); 
			$("#username").css("border","1px solid red");
			return false;  
	  		}
		
		if(b){
			$("#password").css("border","");
			return true;
		  }else{
		     layer.msg('密码至少6位',function() {time:2000}); 
		    $("#password").css("border","1px solid red");
		    	return false;
			}
	})
	 
   

});
</script>
</body>
</html>