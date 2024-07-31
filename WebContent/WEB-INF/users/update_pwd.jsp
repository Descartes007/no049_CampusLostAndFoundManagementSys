
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
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css">  
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">修改密码</div>
          <div class="layui-card-body" pad15>
             <form action="UserServlet?method=updatePwdAct" method="post" >
         
            
       
           
           <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" readonly="readonly"  name="username" value="${list.username }" id="username" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
            <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">密&emsp;码</label>
                <div class="layui-input-inline">
                  <input type="password" name="password"  value="${list.password }" id="password"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" name="repassword"  value="" id="repassword"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
            
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="updatePwd" >确认修改</button>
                  <a href="UserServlet?method=userListAct1&username=${username }" class="layui-btn layui-btn-primary" >返回</a>
                </div>
              </div>
              </form>
            </div>
            
          </div>
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
	  
	 $('#updatePwd').click(function(){  
		  var $1 = $.trim($('#password').val());
		  var $2 = $.trim($("#repassword").val());
		  if($1!=$2){
			  layer.msg('两次密码不一致',function() {time:2000}); 
			
		return false;  
		  }
		  var reg_password=/^\w{4,20}$/;
		  var flag=reg_password.test($1);
		  
		  var reg_repassword=/^\w{4,20}$/;
		  var b=reg_repassword.test($2);
		  if(flag){
				$("#password").css("border","");
				//return true;
	  		}else{
			layer.msg('密码至少5位数字',function() {time:2000}); 
			$("#password").css("border","1px solid red");
			return false;  
	  		}
		
			
	  	  if(b){
			$("#repassword").css("border","");
			
		  }else{
		     layer.msg('确认密码至少4位数字',function() {time:2000}); 
		    $("#repassword").css("border","1px solid red");
		  
			}
	})
	 
   

});
</script>
</body>
</html>