
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
<title>校园失物管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css">  
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">我要留言</div>
          <div class="layui-card-body" pad15>
             <form action="MessageServlet?method=addMessageAct&type=${type}" method="post" >
         
            
           
           <input type="hidden" name="type" value="${type}"/>
          
              <div class="layui-form-item">
                <label class="layui-form-label">留言人</label>
                <div class="layui-input-inline">
                  <input type="text" name="mname" id="mname" readonly value="${username}"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
            
              
              
               <div class="layui-form-item ">
            <label class="layui-form-label">留言内容</label>
            <div class="layui-input-inline">
              <textarea type="text" name="content" id="content" placeholder="请输入留言内容" class="layui-textarea"></textarea>
            </div>
          </div>        
              
           
             
            
             <div class="layui-form-item">
                <label class="layui-form-label">留言时间</label>
                <div class="layui-input-inline">
                  <input type="date" name="createTime" id="createTime"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
             
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="addMessage">确认添加</button>
                  <a href="MessageServlet?method=messageListAct1&=${username }" class="layui-btn layui-btn-primary" >返回</a>
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
	  
	 $('#addMessage').click(function(){  
		  var $1 = $.trim($('#mname').val());
		  var $2 = $.trim($("#content").val());
		  var $3 = $.trim($("#createTime").val());
		 
		     if($1 == ''){  
		         layer.msg('留言人不能为空',function() {time:2000}); 
		         return false;  
		     }
		     if($2 == ''){  
		         layer.msg('留言内容不能为空',function() {time:2000}); 
		         return false;  
		     }
		     if($3 == ''){  
		         layer.msg('留言时间不能为空',function() {time:2000}); 
		         return false;  
		     }
		 
		   
	})
	 
	 
   

});
</script>
</body>
</html>