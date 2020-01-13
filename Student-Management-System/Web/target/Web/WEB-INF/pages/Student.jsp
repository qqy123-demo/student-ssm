<%--
  Created by IntelliJ IDEA.
  User: pengyuyan
  Date: 2020/1/10
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学生信息</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style>
        .div1{

            margin-top: 20px;
            margin-left: 200px;
            margin-right: 200px;
        }
        #delete-div{
            display: none;
        }
       .col-lg-6{
           margin-left: 580px;
       }
        #tab{
            margin-top: 50px;
        }
    </style>
    <script>
        /*删除复选框选中的学生记录*/
        function checkdelete() {
            var obj = document.getElementsByName("check");
            var str ="";
            for (var k=0;k<obj.length;k++) {
                if (obj[k].checked)
                str=str+obj[k].value+" ";
            }
            if(str!=""){
                $.post("/student/delete",{str:str},function (data) {
                    $("#del-div-span").text(data+"点击刷新页面");
                    $("#delete-div").show();
                },"text")
            }else {
                alert("请先选中你要删除的记录！")
            }

        }
        /*全选或全不选，复选框*/
        function check(checkbox) {
            if(checkbox.checked == true){
              var check= document.getElementsByName("check");
                for(var i=0;i<check.length;i++){
                    check[i].checked=true;
                }
            }else {
                var check= document.getElementsByName("check");
                for(var i=0;i<check.length;i++){
                    check[i].checked=false;
                }
            }
        }

        function update(id,name,age,gender,address,profession,grade) {

            alert(id+name+age+gender+address+profession+grade)
        }

       /* function search() {
            $.post("/student/TOsearch_jsp",$("form").serialize(),function (data) {

            },"json")
        }*/

    </script>

</head>
<body>

<%--加载导航条--%>
<jsp:include page="home.jsp"></jsp:include>

<%--删除是否成功提示框--%>
<div class="alert alert-success" role="alert" id="delete-div">
    <a href="${pageContext.request.contextPath}/student/StudentfindAll" class="alert-link"><span id="del-div-span"></span></a>
</div>



<div class="div1">
    <%--工具栏--%>
   <%-- <div class="col-lg-6">
        <div class="input-group">
            <form action="/student/TOsearch_jsp" method="post">
                <input type="text" class="form-control" placeholder="输入学生id" name="Searchid">
                <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">搜索</button>
            </span>
            </form>

        </div>
    </div>
        <br/>--%>
    <%--工具栏--%>


    <%--数据列表--%>
    <table class="table table-bordered" id="tab" >
        <thead >
        <tr align="center">
            <th >
                <label>
                    <input type="checkbox" onclick="check(this)">
                </label>
            </th>
            <th >ID</th>
            <th >姓名</th>
            <th >年龄</th>
            <th >性别</th>
            <th >住址</th>
            <th >专业</th>
            <th >成绩</th>
            <th >编辑</th>

        </tr>
        </thead>

        <tbody>
        <c:forEach items="${pageInfos.list}" var="pageInfo" varStatus="x">
            <tr >
                <td>
                    <label>
                        <input type="checkbox" name="check" value="${pageInfo.id}">
                    </label>
                </td>
                <td name="id">${pageInfo.id}</td>
                <td >${pageInfo.name}</td>
                <td >${pageInfo.age}</td>
                <td >${pageInfo.gender}</td>
                <td >${pageInfo.address}</td>
                <td >${pageInfo.profession}</td>
                <td >${pageInfo.grade}</td>
                <td>
                    <a class="btn btn-default" href="${pageContext.request.contextPath}/student/TOupdate_jsp?id=${pageInfo.id}" role="button">编辑</a>
                    <%--<button type="button" class="btn btn-default" onclick="update('${pageInfo.id}','${pageInfo.name}','${pageInfo.age}','${pageInfo.gender}','${pageInfo.address}','${pageInfo.profession}','${pageInfo.grade}')">Left</button>--%>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--分页导航条--%>
    <div>
        <nav aria-label="...">
            <ul class="pager">
                <li><a href="${pageContext.request.contextPath}/student/StudentfindAll?page=1&size=10">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/student/StudentfindAll?page=${pageInfos.pageNum-1}&size=10">上一页</a></li>
                <c:forEach begin="1" end="${pageInfos.pages}" var="pageNumber">
                    <li><a href="${pageContext.request.contextPath}/student/StudentfindAll?page=${pageNumber}&size=10">${pageNumber}</a></li>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/student/StudentfindAll?page=${pageInfos.pageNum+1}&size=10">下一页</a></li>
                <li><a href="${pageContext.request.contextPath}/student/StudentfindAll?page=${pageInfos.pages}&size=10" aria-label="Next">尾页</a></li>
            </ul>
        </nav>
    </div>
    <%--数据列表--%>
</div>






<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
