
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
          <div class="layui-card-header">修改用户信息</div>
          <div class="layui-card-body" pad15>
             <form action="UserServlet?method=updateUserAct" method="post" >
         
            
           <input type="hidden" name="id" value="${list.id}"> 
           
           <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" name="username" value="${list.username }" id="username" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
            <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">密&emsp;码</label>
                <div class="layui-input-inline">
                  <input type="text" name="password"  value="${list.password }" id="password"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">类&emsp;型</label>
                <div class="layui-input-inline">
                   <input type="radio" name="type" value="1" title="学生" checked>
                  <input type="radio" name="type" value="2" title="管理员">
                </div>
              </div>
              
               <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
              <label class="layui-form-label">性&emsp;别</label>
              <div class="layui-input-inline">
                <select name="sex">
                 
                    <option value="1">男</option>
                 
                    <option value="2">女</option>
                  
                  </optgroup>
                </select>
              </div>
            </div>
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="updateUser" >确认修改</button>
                  <a href="UserServlet?method=userListAct2" class="layui-btn layui-btn-primary" >返回</a>
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
	  
	 $('#updateUser').click(function(){  
		  var $1 = $.trim($('#username').val());
		  var $2 = $.trim($("#password").val());
		  var reg_username=/^\w{4,20}$/;
		  var flag=reg_username.test($1);
		  
		  var reg_password=/^\w{4,20}$/;
		  var b=reg_password.test($2);
		  if(flag){
				$("#username").css("border","");
				//return true;
	  		}else{
			layer.msg('用户名至少4位数字',function() {time:2000}); 
			$("#username").css("border","1px solid red");
			return false;  
	  		}
		
			
	  	  if(b){
			$("#password").css("border","");
			
		  }else{
		     layer.msg('密码至少4位数字',function() {time:2000}); 
		    $("#password").css("border","1px solid red");
		  
			}
	})
	 
   

});
</script>
</body>
</html>