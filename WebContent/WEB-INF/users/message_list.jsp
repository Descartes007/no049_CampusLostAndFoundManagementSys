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
<title>留言管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css"> 
</head>
<body>

 <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">留言信息</div>
          <div class="layui-card-body">
         
          
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="200">
                
                <col width="400">
                <col width="200">
                 <col width="200">
                <col>
              </colgroup>
              <thead>
               <tr>
			      <th>序号</th>
			      <th>留言人</th>
			      <th>留言内容</th>
			      <th>留言时间</th>
			      
			       
			       <th>操作</th>
			     
    			</tr> 
              </thead>
              <tbody>
                <c:forEach items="${list}" var="m" >
    <tr>
       <td>${m.id }</td>
      <td>${m.mname }</td>
      <td>${m.content }</td>
       
    <td>${m.createTime }</td>
   
     
       
       <td>
      
             <a href="MessageServlet?method=queryMessageAct&id=${m.id}" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon">&#xe642;</i></a>
    		
    		 <a onclick="return del();" href="MessageServlet?method=deleteMessageAct&id=${m.id}&type=${type}" class="layui-btn layui-btn-sm layui-btn-danger"><i class="layui-icon">&#xe640;</i></a></td>
    		
    </tr>
   </c:forEach>
              </tbody>
            </table>
          
          </div>
        </div>
      </div>
       <div style="text-align:right;font-size:18px;">
      <c:choose>
          <c:when test="${pageBean.currentPage==pageBean.firstPage}">
              首页&nbsp;
              上一页
          </c:when>
           <c:otherwise>
               <a href="${pageContext.request.contextPath}/MessageServlet?method=MessageListAct2&currentPage=${pageBean.firstPage}&pageSize=${pageBean.pageSize}">首页&nbsp;</a>
               <a href="${pageContext.request.contextPath}/MessageServlet?method=MessageListAct2&currentPage=${pageBean.prePage}&pageSize=${pageBean.pageSize}">上一页&nbsp;</a>
           </c:otherwise>
       </c:choose>
       <c:choose>
           <c:when test="${pageBean.currentPage==pageBean.totalPage}">
              下一页&nbsp;
               尾页
           </c:when>
           <c:otherwise>
               <a href="${pageContext.request.contextPath}/MessageServlet?method=MessageListAct2&currentPage=${pageBean.nextPage}&pageSize=${pageBean.pageSize}">
                   下一页&nbsp;
               </a>
               <a href="${pageContext.request.contextPath}/MessageServlet?method=MessageListAct2&currentPage=${pageBean.totalPage}&pageSize=${pageBean.pageSize}">               尾页&nbsp;</a>
           </c:otherwise>
       </c:choose>
            当前页为第${pageBean.currentPage}页/共${pageBean.totalPage}页
            总记录数是${pageBean.totalCount}条/
            <%--
            //todo 需求2
             用户输入每页显示数据的大小
            当输入完,焦点一释放就获取它的值使用js的onblur实现
            --%>
            每页显示<input type="text" id="pageSize" style="width: 25px" value="${pageBean.pageSize}" onblur="changePageSize()" >条
        <%--
         //todo 需求3:
          跳转到第几页
          分析:将它设计成一个下拉的列表供选择第几页
        --%>
        跳转到第<input type="text" id="currentPage" size="2"
                   value="${pageBean.currentPage}" onblur="changePage()">页
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
	if(confirm("确定删除吗")){
		return  true;
		//alert("删除成功");
	}else{
		return false;
	};
} 

</script>
</body>
</html>