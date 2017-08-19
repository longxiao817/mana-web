<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<%@include file="/include/css-file.jsp"%>
	<link rel="stylesheet" href="${ctp}/css/main.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	.tree-closed {
	    height : 40px;
	}
	.tree-expanded {
	    height : auto;
	}
	</style>
</head>
<body>
	<div class="col-sm-3 col-md-2 sidebar">
		<div class="tree">
			<ul style="padding-left:0px;" class="list-group">
				<li><a href="#">控制面板</a></li>
				<c:forEach items="${sessionScope.menu }" var="permission">
					<li class="list-group-item tree-closed">
						<span><i class="${permission.icon }"></i> ${permission.name }
						<span class="badge" style="float:right">
						${fn:length(permission.childs)}</span></span>
					
						<ul style="margin-top:10px;display:none;">
							<c:forEach items="${permission.childs}" var="per">
								<li><a href="${ctp }/${per.url}"><i class="${per.icon }"></i>${per.name } </a></li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<%@include file="/include/jquery-file.jsp" %>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            });
        </script>
</body>
</html>