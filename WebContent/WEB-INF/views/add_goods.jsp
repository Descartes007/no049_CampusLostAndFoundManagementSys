
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
          <div class="layui-card-header">添加失物信息</div>
          <div class="layui-card-body" pad15>
             <form action="GoodsServlet?method=addGoodsAct" method="post" >
         
            
           
           <input type="hidden" name="type" value="${type}" />
         
              <div class="layui-form-item">
                <label class="layui-form-label">物品名称</label>
                <div class="layui-input-inline">
                  <input type="text" name="gname" id="gname" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
            
              <div class="layui-form-item">
                <label class="layui-form-label">丢失地点</label>
                <div class="layui-input-inline">
                  <input type="text" name="lostPlace" id="lostPlace"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
               <div class="layui-form-item ">
            <label class="layui-form-label">物品特征</label>
            <div class="layui-input-inline">
              <textarea type="text" name="info2" id="info2" placeholder="请输入丢失物品特征" class="layui-textarea"></textarea>
            </div>
          </div>        
              
           
              
              <div class="layui-form-item">
                <label class="layui-form-label">丢失人</label>
                <div class="layui-input-inline">
                  <input type="text" name="whoLost" id="whoLost"  value="${username} "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
           
              
             
            
              <div class="layui-form-item">
              <label class="layui-form-label">状态</label>
              <div class="layui-input-inline">
                <select name="status">
                
                    <option value="1">已丢失</option>
                 
                    <option value="2">已找到</option>
                  
                
                </select>
              </div>
            </div>
            
             <div class="layui-form-item">
                <label class="layui-form-label">丢失时间</label>
                <div class="layui-input-inline">
                  <input type="date" name="createTime" id="createTime"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline">
                  <input type="text" name="phone" id="phone"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="addGoods">确认添加</button>
                  <a href="GoodsServlet?method=goodsListAct2" class="layui-btn layui-btn-primary" >返回</a>
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
	  
	 $('#addGoods').click(function(){  
		  var $1 = $.trim($('#gname').val());
		  var $2 = $.trim($("#lostPlace").val());
		  var $3 = $.trim($("#whoLost").val());
		  var $4 = $.trim($("#info2").val());
		  var $5 = $.trim($("#createTime").val());
		  var $6 = $.trim($("#phone").val());
		     if($1 == ''){  
		         layer.msg('物品名称不能为空',function() {time:2000}); 
		         return false;  
		     }
		     if($2 == ''){  
		         layer.msg('丢失地点不能为空',function() {time:2000}); 
		         return false;  
		     }
		     if($3 == ''){  
		         layer.msg('丢失人不能为空',function() {time:2000}); 
		         return false;  
		     }
		     if($4 == ''){  
		         layer.msg('物品特征信息不能为空',function() {time:2000}); 
		         return false;  
		     }
		     if($5 == ''){  
		         layer.msg('丢失日期不能为空',function() {time:2000}); 
		         return false;  
		     }
		    
		     if($6== ''){  
		         layer.msg('联系人电话不能为空',function() {time:2000}); 
		         return false;  
		     }
		   
	})
	 
	 
   

});
</script>
</body>
</html>