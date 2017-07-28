<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/clientlib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/clientlib/bootstrapvalidator/css/bootstrapValidator.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/clientlib/jquery/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/clientlib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/clientlib/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
</head>
<body>

    <form name="form1" class="form-group" action="${pageContext.request.contextPath}/user/fileUpload" method="post" enctype="multipart/form-data">
        <h1>采用流的方式上传文件</h1>
        <div class="form-group">
            <label for="ifile">上传图片</label>
            <input type="file" id="ifile" name="fileName">
        </div>
        <button type="submit" class="btn btn-success">提交</button>
    </form>
    <form name="form2" class="form-group" action="${pageContext.request.contextPath}/user/fileUpload2" method="post" enctype="multipart/form-data">
        <h1>采用multipart提供的file.transfer方法上传文件</h1>
        <div class="form-group">
            <label for="ifile2">上传图片</label>
            <input type="file" id="ifile2" name="fileName2">
        </div>
        <button type="submit" class="btn btn-success">提交</button>
    </form>
    <form name="form3" class="form-group" action="${pageContext.request.contextPath}/user/fileUpload3" method="post" enctype="multipart/form-data">
        <h1>使用spring mvc提供的类的方法上传文件</h1>
        <div class="form-group">
            <label for="ifile3">上传图片</label>
            <input type="file" id="ifile3" name="fileName3">
        </div>
        <button type="submit" class="btn btn-success">提交</button>
    </form>
</body>
