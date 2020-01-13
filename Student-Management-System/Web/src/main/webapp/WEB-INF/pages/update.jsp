<%--
  Created by IntelliJ IDEA.
  User: pengyuyan
  Date: 2020/1/10
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>更新学生信息</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style>
        .tab1{
            margin-top: 150px;
            margin-left: 600px;
            width: 35%;
            height: 45%;
        }
        .col-sm-10{
            width:250px;
        }
        .tab2{
            margin-left: 150px;
        }

        .tab3{
            width: 500px;
            float: left;
        }
        #update-div{
            display: none;
        }
    </style>
    <script>
      function update() {
          $.post("/student/update?upid=${byId.id}",$("form").serialize(),function (data) {
              $("#update-div-span").text(data+"   点击刷新页面");
              $("#update-div").show();
          },"text")
      }
    </script>
</head>
<body>
<%--加载导航条--%>
<jsp:include page="home.jsp"></jsp:include>

<%--添加成功提示框--%>
<div class="alert alert-success" role="alert" id="update-div">
    <a href="${pageContext.request.contextPath}/student/StudentfindAll" class="alert-link"><span id="update-div-span"></span></a>
</div>

        <div class="tab1">
            <div class="tab2">
                <h4>更新学生信息</h4>
                <br/>
            </div>
            <div class="tab3">
                <form  class="form-horizontal" method="post" action="/student/update">
                    <div class="form-group">
                        <label for="id" class="col-sm-2 control-label">学号:</label>
                        <div class="col-sm-10" >
                            <input  type="text" class="form-control" id="id" placeholder="${byId.id}" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名：</label>
                        <div class="col-sm-10" >
                            <input  type="text" class="form-control" id="name" placeholder="${byId.name}" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age" class="col-sm-2 control-label">年龄：</label>
                        <div class="col-sm-10" >
                            <input  type="text" class="form-control" id="age" placeholder="${byId.age}" name="age">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="gender" class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-10" >
                            <input  type="text" class="form-control" id="gender" placeholder="${byId.gender}" name="gender">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">住址：</label>
                        <div class="col-sm-10" >
                            <input  type="text" class="form-control" id="address" placeholder="${byId.address}" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="profession" class="col-sm-2 control-label">专业：</label>
                        <div class="col-sm-10" >
                            <input  type="text" class="form-control" id="profession" placeholder="${byId.profession}" name="profession">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="grade" class="col-sm-2 control-label">成绩：</label>
                        <div class="col-sm-10" >
                            <input  type="text" class="form-control" id="grade" placeholder="${byId.grade}" name="grade">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-primary"  onclick="update()">提交</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
