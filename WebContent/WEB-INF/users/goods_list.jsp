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
<title>失物管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css"> 
</head>
<body>

 <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">失物信息</div>
          <div class="layui-card-body">
        
           
          
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="200">
                <col width="200">
                <col width="400">
                <col width="100">
                 <col width="200">
                 <col width="200">
                  <col width="150">
                <col>
              </colgroup>
              <thead>
               <tr>
			      <th>序号</th>
			      <th>物品名称</th>
			      <th>丢失地点</th>
			      <th>物品特征信息</th>
			      <th>丢失状态</th>
			       <th>丢失人</th>
			       <th>丢失时间</th>
			         <th>联系电话</th>
			       
			       <th>操作</th>
			     
    			</tr> 
              </thead>
              <tbody>
                <c:forEach items="${list}" var="g" >
    <tr>
       <td>${g.id }</td>
      <td>${g.gname }</td>
      <td>${g.lostPlace }</td>
        <td>${g.info }</td>
      <td>
     <c:choose>
                   <c:when test="${g.status==1}">
                 	已经丢失
                   </c:when>
                   <c:otherwise>
                	已经找到
                   </c:otherwise></c:choose>
 
      </td>
        <td>${g.whoLost }</td>
    <td>${g.createTime }</td>
     <td>${g.phone }</td>
     
       
       <td>
      
           
    		
    		 <a onclick="return del();" href="GoodsServlet?method=deleteGoodsAct&id=${g.id}&type=${type}" class="layui-btn layui-btn-sm layui-btn-danger"><i class="layui-icon">取消挂失</i></a></td>
    		
    </tr>
   </c:forEach>
              </tbody>
            </table>
          
          </div>
        </div>
      </div>
      
      
<script src="layui/layui.js"></script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  
 

});
</script>
<script>
function del(){
	if(confirm("确定取消挂失吗")){
		return  true;
		//alert("删除成功");
	}else{
		return false;
	};
} 

</script>
</body>
</html>