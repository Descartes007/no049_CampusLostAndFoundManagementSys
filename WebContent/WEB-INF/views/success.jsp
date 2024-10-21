<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册成功</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <link rel="stylesheet" href="layui/css/admin.css" media="all"> 
</head>
<body>	

        <div class="layui-card">
          <div class="layui-card-header">
      注册信息反馈
            <i class="layui-icon layui-icon-tips" lay-tips="要支持的噢" lay-offset="5"></i>
          </div>
          <div class="layui-card-body layui-text layadmin-text">
           <%
String msg = (String)request.getAttribute("msg");
if (msg=="ok"){	
response.setHeader("refresh","3;URL=LoginServlet?method=login");//这里的3,是你要确定的时间秒 URL是要跳转的地址	
%>
	<font color="red" size="5"><br>注册成功 三秒后将跳转到登录页面 <br>	
		如果没有跳转,请点击 <a href="LoginServlet?method=login">这里</a>!!! <br>
			</font>	
<%		
	} 
else {	
					
					
		response.setHeader("refresh","3;URL=UserServlet?method=toRegsiteAct");	
							%>
							<font color="red" size="5"> 注册失败！信息有误<br> 三秒后将跳转到登录页面 <br>		
							如果没有跳转,请点击 <a href="UserServlet?method=toRegsiteAct">这里</a>!!! <br>
								</font>
									<%	
									}		
				
					%>
          </div>
        </div>
      </div>
      
  </body>

</html>