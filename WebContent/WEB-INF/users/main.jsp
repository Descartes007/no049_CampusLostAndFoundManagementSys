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
<title>校园失物系统</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <link rel="stylesheet" href="layui/css/admin.css" media="all"> 
</head>
<body class="layui-layout-body">
  
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
            <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
         
         
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          
         
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <cite>欢迎${username}</cite>
            </a>
            <dl class="layui-nav-child">
             
              
               <dd><a href="LoginServlet?method=loginOutAct">退出登陆</a></dd>
              <dd layadmin-event="logout" style="text-align: center;"></dd>
            </dl>
          </li>
          
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="home/console.html">
            <span>校园失物招领后台</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="console" class="layui-this">
                  <a href="UserServlet?method=consoleAct"  target="mainFrame">控制台</a>
                </dd>
                
              </dl>
            </li>
            <li data-name="" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>用户管理</cite>
              </a>
              <dl class="layui-nav-child">
              <c:if test="${type==1}">
               <dd class="layui-nav-itemed">
                  <a href="UserServlet?method=userListAct1&username=${username}" target="mainFrame">个人信息</a>
                </dd>
                <dd class="layui-nav-itemed">
                  <a href="UserServlet?method=queryUserNameAct&username=${username}" target="mainFrame">修改密码</a>
                </dd>
              </c:if>
                
              </dl>
            </li>
            
            <li data-name="" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>失物管理</cite>
              </a>
              <dl class="layui-nav-child">
              <c:if test="${type==1}">
               <dd class="layui-nav-itemed">
                  <a href="GoodsServlet?method=goodsListAct" target="mainFrame">查看失物信息</a>
                </dd>
                 <dd class="layui-nav-itemed">
                  <a href="GoodsServlet?method=goodsListAct1&whoLost=${username}" target="mainFrame">我的失物信息</a>
                </dd>
                <dd class="layui-nav-itemed">
                  <a href="GoodsServlet?method=toAddGoodsAct1&type=${type}" target="mainFrame">我要挂失</a>
                </dd>
              </c:if>
                
              </dl>
            </li>
            
             <li data-name="" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>留言管理</cite>
              </a>
              <dl class="layui-nav-child">
              <c:if test="${type==1}">
              <dd class="layui-nav-itemed">
                  <a href="MessageServlet?method=messageListAct3" target="mainFrame">留言板</a>
                </dd>
               <dd class="layui-nav-itemed">
                  <a href="MessageServlet?method=messageListAct1&mname=${username}" target="mainFrame">我的留言</a>
                </dd>
                <dd class="layui-nav-itemed">
                  <a href="MessageServlet?method=toAddMessageAct1&type=${type}" target="mainFrame">我要留言</a>
                </dd>
              </c:if>
                
              </dl>
            </li>
            
            
          
			
           
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
         <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div> 
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="UserServlet?method=consoleAct" id="mainFrame" name="mainFrame" style="width:100%;height:100%;"  frameborder="0" class="mainFrame"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

<script src="layui/layui.js"></script>
<script>

layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>