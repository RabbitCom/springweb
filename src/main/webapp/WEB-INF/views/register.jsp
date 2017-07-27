<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<web-app xmlns="http://java.sun.com/xml/ns/j2ee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd"
         version="2.4">
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <%
        String contextPath=request.getContextPath();
//        ${pageContext.request.contextPath}
    %>
    <link href="<%=contextPath%>/clientlib/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <form class="form-horizontal" action="<%=contextPath%>/user/registerUser" method="post">
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
                <h1>你好，世界！</h1>
            </div>
        </div>
        <div class="form-group">
            <label for="login_name" class="col-sm-3 control-label">用户名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="name" id="login_name" placeholder="请输入用户名">
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">密码</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <label for="repassword" class="col-sm-3 control-label">重输密码</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="repassword" id="repassword" placeholder="请重复输入密码">
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-3 control-label">手机号</label>
            <div class="col-sm-6">
                <input type="number" class="form-control" name="phoneNumber" id="phone" placeholder="请输入手机号">
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group  has-feedback">
            <label for="email" class="col-sm-3 control-label">邮箱</label>
            <div class=" col-sm-6">
                <div class="input-group">
                    <input type="email" class="col-sm-8 form-control input-group-sm" id="email" placeholder="请输入邮箱">
                    <span class="input-group-addon">@</span>
                    <select class="form-control input-group-sm">
                        <option>163.com</option>
                        <option>gmail.com</option>
                        <option selected="selected">qq.com</option>
                        <option>outlook.com</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group" >
            <div class="col-sm-offset-3 col-sm-9">
                <div class="checkbox">
                    <label>
                        <input type="checkbox">请确认
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <button type="submit" class="btn btn-success">立即注册</button>
            </div>
        </div>

    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=contextPath%>/clientlib/js/bootstrap.min.js"></script>
</body>
</html>
