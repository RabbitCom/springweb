<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <link href="clientlib/css/bootstrap.min.css" rel="stylesheet">
    <link href="clientlib/css/cnlive.css" rel="stylesheet">
    <link href="clientlib/css/cnlive-common.css" rel="stylesheet">
    <script type="text/javascript" src="clientlib/jquery/jquery-1.10.2.min.js"></script>
</head>
 
	<style> .form-group{ width:95%; }  
.regi_more_line{ margin: 6px 0px; height: 20px; border-top:1px solid #DBDBDB; position: relative; z-index: 1;}
.regi_more_title{ display: block; margin-top: -12px; position: absolute; left: 50%; margin-left: -52px; z-index: 10; width: 100px; text-align: center; background: #ffffff; font-size: 12px;}
.regi_more_text{ margin-left: 92px;}
</style>
     
   
<body id="cas">
  <div id="container">
      <header class="le-head-uc tm" id="le-head-uc">
	    <div class="comwidth clearfix">
	        <h1 class="pull-left logo">
			<a href="http://www.cnlive.com/" target="_top"><img src="http://yweb2.cnliveimg.com/sites/cnlive/zgwj_sxy_logo.png" alt="logo" style="height: 70px;width: 160px;"></a>
	        </h1>
			<ul class="pull-left navbar">
				<li><a href="http://open.cnlive.com/" target="_top">首页</a></li>
				<li>
					<a href="javascript:;" class="le-header-uc-link">产品<i class="drop"></i></a>
					<div class="le-header-uc-items items-product clearfix">
						<ul class="item clearfix">
							<li><a href="http://open.cnlive.com/other/openplatform/vod.html" target="_top">点播云</a></li>
                            <li><a href="http://open.cnlive.com/other/openplatform/livecloud.html" target="_top">直播云</a></li>
                            <li><a href="http://open.cnlive.com/other/openplatform/icms.html" target="_top">发布云</a></li>
                            <li><a href="http://open.cnlive.com/other/openplatform/staticscloud.html" target="_top">统计云</a></li>
                            <li><a href="http://open.cnlive.com/other/openplatform/paycloud.html" target="_top">支付云</a></li>
			     		</ul>
						<i class="arrow"></i>
					</div>
				</li>
				<li><a href="http://console.open.cnlive.com/open/doc/sys/zbsc" target="_top">帮助与支持</a></li>
				<li><a href="http://new.cnlive.com/web/aboutus/gongsibeijing.jsp" target="_top">关于</a></li>
			</ul>
	        <!--未登录-->
	        <div class="pull-right user" id="Login_n">
	            <div class="pull-left link-gray6 login">
	                <!-- <a href="https://user.cnlive.com/OpenSSO2/login?service=http://console.open.cnlive.com/open/console" target="_top" id="le-link-login">登录</a>
	                <a href="http://www2.cnlive.com/web/zhuce.jsp?service=http://console.open.cnlive.com/open/console" target="_top">注册</a> -->
	            </div>
            </div>
	    </div>
	</header>
    <div id="content">
        <section class="le-user-warp vod clearfix">
			<!--header/S-->
			<div class="header-dbSpe" style="background-color: #052f5f;">
				    
				        <div class="head-content comwidth head-img">
				        <img src="clientlib/images/login-bg.jpg" style="width:1357px;heigth=725px;" alt="banner">
				    
				    
 
<div id="login">
	<form id="fm1Form" name="fm1" class="form-horizontal" action="${pageContext.request.contextPath}/user/login" method="post">
		<div style="position: absolute; top: 109px; right: 50px; width: 460px; height: 490px; background: #fff; border-radius: 6px;">
			<div style="margin-top: 28px; margin-left: 22px; margin-bottom: -10px">
				<p class="text-left">
				<h4>用户登录</h4>
				</p>
			</div>
			<hr width="90%">
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					
				</div>
			</div>
			<div class="form-group">
				<label for="username" class="col-sm-3 control-label">账&nbsp;&nbsp;号:</label>
				<div class="col-sm-9">					
							
							<input id="username" name="username" class="form-control" tabindex="1" placeholder="手机号/邮箱/用户名" accesskey="n" type="text" value="" size="25" autocomplete="off"/>
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">密&nbsp;&nbsp;码:</label>
				<div class="col-sm-9">
					
					<input id="password" name="password" class="form-control" tabindex="2" placeholder="密码" accesskey="p" type="password" value="" size="25" autocomplete="off"/>
					<span id="capslock-on" style="display: none;">
						<p>
							<img src="clientlib/images/warning.png" valign="top">
							CAPSLOCK key is turned on!
						</p>
					</span>
				</div>
			</div>
			
		 
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<a href="#"  class="link-quick-reg link-red">忘记密码</a> <a href="${pageContext.request.contextPath}/user/register.jsp"
						style="margin-left: 180px;" class="link-quick-reg link-red">快速注册</a>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<input class="btn btn-default" name="submit" accesskey="l"
						value="登&nbsp;&nbsp;录" id="fm1" tabindex="6" type="submit"
						style="width: 296px;" />
				</div>
			</div>
			<div class="form-group">
			  <div class="col-sm-offset-3 col-sm-9">
			    <p class="regi_more_line">
				   <span class="regi_more_title">其他方式登录</span>
				</p>
			  </div>
			</div>
		</div>
	<div>
</div></form>
</div>
<!--header/E-->
<!--content/S-->



</div>
</div>
</section>
</div> <!-- END #content -->

</div> <!-- END #container -->

</body>
</html>

 

