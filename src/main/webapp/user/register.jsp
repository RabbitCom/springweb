<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/clientlib/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/clientlib/css/bootstrapValidator.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/clientlib/jquery/jquery-1.10.2.min.js"></script>
</head>
<body>
    <form id="registerForm" class="form-horizontal" action="${pageContext.request.contextPath}/user/registerUser" method="post">
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
                <%--<div class="input-group">--%>
                    <input type="email" class="col-sm-8 form-control input-group-sm" name="email" id="email1" placeholder="请输入邮箱">
                    <%--<span class="input-group-addon">@</span>
                    <select class="form-control input-group-sm">
                        <option>163.com</option>
                        <option>gmail.com</option>
                        <option selected="selected">qq.com</option>
                        <option>outlook.com</option>
                    </select>--%>
                <%--</div>--%>
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
    <script src="${pageContext.request.contextPath}/clientlib/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/clientlib/js/bootstrapValidator.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#registerForm')
                .bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        name: {
                            message: 'The name is not valid',
                            validators: {
                                notEmpty: {
                                    message: 'The name is required and cannot be empty'
                                },
                                stringLength: {
                                    min: 1,
                                    max: 30,
                                    message: 'The username must be more than 6 and less than 30 characters long'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z0-9_\.]+$/,
                                    message: 'The username can only consist of alphabetical, number, dot and underscore'
                                },
                                different: {
                                    field: 'password',
                                    message: 'The username and password cannot be the same as each other'
                                }
                            }
                        },
                        email: {
                            validators: {
                                emailAddress: {
                                    message: 'The input is not a valid email address'
                                }
                            }
                        },
                        password: {
                            validators: {
                                notEmpty: {},
                                identical: {
                                    field: 'repassword',
                                    message: 'The password and its confirm are not the same'
                                },
                                different: {
                                    field: 'username',
                                    message: 'The password cannot be the same as username'
                                }
                            }
                        },
                        repassword: {
                            validators: {
                                notEmpty: {},
                                identical: {
                                    field: 'password'
                                },
                                different: {
                                    field: 'username',
                                    message: 'The password cannot be the same as username'
                                }
                            }
                        },
                        phoneNumber:{
                            validators:{
                                notEmpty:{},
                                regexp: {
                                    regexp: /^[0-9_\.]{11,11}$/,
                                    message: 'The phoneNumber can only consist of 11 number'
                                },
                            }
                        }
                    }
                })
                .on('error.field.bv', function(e, data) {
                    var messages = data.bv.getMessages(data.field);
                    $('#errors').find('li[data-bv-for="' + data.field + '"]').remove();
                    for (var i in messages) {
                        $('<li/>').attr('data-bv-for', data.field).html(messages[i]).appendTo('#errors');
                    }
                    $('#errors').parents('.form-group').removeClass('hide');
                })
                .on('success.field.bv', function(e, data) {
                    $('#errors').find('li[data-bv-for="' + data.field + '"]').remove();
                })
                .on('success.form.bv', function(e) {
                    $('#errors')
                        .html('')
                        .parents('.form-group').addClass('hide');
                });
        });
    </script>
</body>
</html>
