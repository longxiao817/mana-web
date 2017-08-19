<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<%@ include file="/WEB-INF/includes/css-file.jsp"%>
<link rel="stylesheet" href="${ctp}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}

textarea {
  resize : none;
}

</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="#">MGT -
						游戏管理</a>
				</div>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li style="padding-top: 8px;">
						<div class="btn-group">
							<button type="button"
								class="btn btn-default btn-success dropdown-toggle"
								data-toggle="dropdown">
								<i class="glyphicon glyphicon-user"></i> 张三 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#"><i class="glyphicon glyphicon-cog"></i>
										个人设置</a></li>
								<li><a href="#"><i class="glyphicon glyphicon-comment"></i>
										消息</a></li>
								<li class="divider"></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-off"></i> 退出系统</a></li>
							</ul>
						</div>
					</li>
					<li style="margin-left: 10px; padding-top: 8px;">
						<button type="button" class="btn btn-default btn-danger">
							<span class="glyphicon glyphicon-question-sign"></span> 帮助
						</button>
					</li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<ul style="padding-left: 0px;" class="list-group">
						<li class="list-group-item tree-closed"><a href="main.html"><i
								class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
						<li class="list-group-item tree-closed"><span><i
								class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span
								class="badge" style="float: right">3</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="user.html"><i
										class="glyphicon glyphicon-user"></i> 用户维护</a></li>
								<li style="height: 30px;"><a href="role.html"><i
										class="glyphicon glyphicon-king"></i> 角色维护</a></li>
								<li style="height: 30px;"><a href="permission.html"><i
										class="glyphicon glyphicon-lock"></i> 许可维护</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i
								class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge"
								style="float: right">3</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="auth_cert.html"><i
										class="glyphicon glyphicon-check"></i> 实名认证审核</a></li>
								<li style="height: 30px;"><a href="game1.jsp"><i
										class="glyphicon glyphicon-check"></i> 广告审核</a></li>
								<li style="height: 30px;"><a href="game1.jsp"><i
										class="glyphicon glyphicon-check"></i> 项目审核</a></li>
							</ul></li>
						<li class="list-group-item"><span><i
								class="glyphicon glyphicon-th-large"></i> 业务管理 <span
								class="badge" style="float: right">7</span></span>
							<ul style="margin-top: 10px;">
								<li style="height: 30px;"><a href="cert.html"><i
										class="glyphicon glyphicon-picture"></i> 资质维护</a></li>
								<li style="height: 30px;"><a href="type.html"><i
										class="glyphicon glyphicon-equalizer"></i> 分类管理</a></li>
								<li style="height: 30px;"><a href="process.html"><i
										class="glyphicon glyphicon-random"></i> 流程管理</a></li>
								<li style="height: 30px;"><a href="game1.jsp"
									style="color: red;"><i class="glyphicon glyphicon-hdd"></i>
										广告管理</a></li>
								<li style="height: 30px;"><a href="message.html"><i
										class="glyphicon glyphicon-comment"></i> 消息模板</a></li>
								<li style="height: 30px;"><a href="project_type.html"><i
										class="glyphicon glyphicon-list"></i> 项目分类</a></li>
								<li style="height: 30px;"><a href="tag.html"><i
										class="glyphicon glyphicon-tags"></i> 项目标签</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i
								class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="" method="post" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
								<div class="btn-group">
								  <button type="button" class="btn btn-primary">查询分类</button>
								  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    <span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <input class="form-control has-success" type="text" id="search_input"
								  name="sp" value="${searchCondition}" placeholder="请输入查询内容关键字">
							  	<ul class="dropdown-menu">
								    <li><a class="inform_btn"  href="">未举报</a></li>
								    <li><a class="inform_btn"  href="">已举报</a></li>
							  	</ul>
							</div>
								</div>
							</div>
							<button id="searchBtn" type="submit" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table id="gamesTable" class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th>回复内容</th>
				  						<th>回复时间</th>
				  						<th>状态</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${reply_info.list }" var="reply">
									<tr>
										<td>${reply.id }</td>
										<td>${fn:substring(reply.content,0,30) }</td>
										<td>
										<c:if test="${not empty reply.time }">
											<fmt:formatDate value="${reply.time }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</c:if>
										</td>
										<td>
										<c:if test="${reply.status == 1}"> 被举报</c:if>
										<c:if test="${reply.status != 1}"> 未举报</c:if>
										</td>
										<td>
												<button u_id="${user.id}" r_detail="${reply.content }" type="button" class="btn btn-success btn-xs showBtn">
													<i class=" glyphicon glyphicon-check"></i>
												</button>
												<button d_id="${reply.id}" type="button" class="btn btn-danger btn-xs deleteBtn">
													<i class=" glyphicon glyphicon-remove"></i>
												</button>
											</td>
									</tr>
								</c:forEach>
								</tbody>
								<tfoot>
									<tr>
									<td colspan="6" align="center">
									<ul class="pagination">
									<li><a href="${ctp}/manager/message/list?pn=1">首页</a></li>
									<c:if test="${reply_info.hasPreviousPage }">
													<!-- 分页时也要带上查询条件 -->
													<li><a
														href="${ctp}/manager/message/list?pn=${reply_info.prePage}">上一页</a></li>
												</c:if>
												<!-- 遍历连续显示的页面 -->
												<c:forEach items="${reply_info.navigatepageNums }" var="pn">
													<c:if test="${pn == reply_info.pageNum}">
														<li class="active"><a
															href="${ctp}/manager/message/list?pn=${pn}">${pn } <span
																class="sr-only">(current)</span></a></li>
													</c:if>
													<c:if test="${pn != reply_info.pageNum}">
														<li><a href="${ctp}/manager/message/list?pn=${pn }">${pn }</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${reply_info.hasNextPage}">
													<li><a
														href="${ctp}/manager/message/list?pn=${reply_info.nextPage}">下一页</a></li>
												</c:if>
									<li><a href="${ctp}/manager/message/list?pn=${reply_info.pages}">末页</a></li>
									</ul>
									
									</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/includes/js-file.jsp"%>
	
	<!-- 游戏详细信息Modal -->
	<div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">回复信息</h4>
				</div>
				<div class="modal-body">
				<textarea rows="10" cols="78"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="gameBtn" g_id="">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	$(function() {
		$(".list-group-item").click(function() {
			if ($(this).find("ul")) {
				$(this).toggleClass("tree-closed");
				if ($(this).hasClass("tree-closed")) {
					$("ul", this).hide("fast");
				} else {
					$("ul", this).show("fast");
				}
			}
		});
	});
	
	
	
 	$(".inform_btn").click(function(){
		var status = $(this).html()
		var rs="";
		if("已举报"== status){
			rs = 1;
		}else{
			rs = 0
		}
		var href ="${ctp}/manager/message/list?status="+rs
		$(this).attr("href",href)
		
	})
	
	
	
	
	$("#searchBtn").click(function(){
		var searchParm = $("#search_input").val()
		location.href = "${ctp}/manager/message/list?pn=1&sp="+searchParm+"&status="
		return false;
	})
	var search ="${param.status}"
	//给所有的超链接添加搜索条件
	$(".pagination").find("a").click(function(){
		var searchCondition = $("input[name='sp']").val()
		alert(searchCondition)
		var href = $(this).attr("href")+"&sp="+searchCondition+"&status="+search
		$(this).attr("href",href)
	})
	
	//查看回复的详细内容
	$(".showBtn").click(function(){
		var deatils = $(this).attr("r_detail")
		$("textarea").html(deatils)
		$("#replyModal").modal("show");
	})
	
	//删除回复
	$(".deleteBtn").click(function(){
		var d_id = $(this).attr("d_id")
		if(confirm("你确定要删除【"+ d_id+"】号回复吗")){
		location.href = "${ctp}/manager/message/delete?id="+d_id;
			
		}
		return false;
	})

	</script>
</body>
</html>
