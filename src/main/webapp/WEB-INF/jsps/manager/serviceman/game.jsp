<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text"
										id="search_input" placeholder="请输入游戏名字">
								</div>
							</div>
							<button id="searchBtn" type="button" class="btn btn-warning">
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
										<th>游戏名</th>
										<th>版本</th>
										<th>标签</th>
										<th>状态</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
								<tfoot>
									<tr>
									<td id="pageBar_td"colspan="6" align="center"></td>
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
	<!--审核 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">审核</h4>
				</div>
				<div class="modal-body">
				审核通过:
					 <input type="radio" name="options" id="option2" autocomplete="off" value="审核通过">通过
					<p>
					<p />
					<div >
						审核不通过:
						<div>
						<input type="radio"
							name="options" id="option1" autocomplete="off" value="辱骂、歧视、挑衅等不友善的内容">辱骂、歧视、挑衅等不友善的内容
						</div>
						<div>	
						<input type="radio"
							name="options" id="option2" autocomplete="off" value="广告或垃圾信息">广告或垃圾信息						
						</div>
						<div>
						<input type="radio"
							name="options" id="option3" autocomplete="off" value="暴力、色情、政治敏感等违反法律法规的内容"> 暴力、色情、政治敏感等违反法律法规的内容
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="submitBtn" c_id="">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 游戏详细信息Modal -->
	<div class="modal fade" id="myGameModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">游戏信息</h4>
				</div>
				<div class="modal-body">
				游戏名称：<span class="g_name"><h1></h1></span><p></p>
				<div class="input-group">
				游戏标签：<span class="g_tab"></span><p></p>
				游戏介绍：<textarea rows="5" cols="78"></textarea>
				游戏图片：<img class="g_showimg" style='height:200px;width:300px;' src=''>"
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="gameBtn" g_id="">保存</button>
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
	

	$("#searchBtn").click(function(){
		var search =$("#search_input").val();
		getAllGames(1)
	})

	//获取所有广告在页面显示
	function getAllGames(pn){
		var search =$("#search_input").val();
		$.ajax({
			url:"${ctp}/manager/game/json",
			type:"get",
			data:{pn:pn,sp:search},
			beforeSend : function() {
				index = layer.load();
			},
			success:function(result){
				showGamesToTable($("#gamesTable"),result.list),
				console.log(result.list);
				//显示分页条数据
				buildPageLi(result);
				
				layer.close(index);
				
			},
			
		})
	}
	
	//构建分页条
	 function buildPageLi(page){
		var ulEle = $("<ul></ul>").addClass("pagination")
		//首页
		ulEle.append($("<li><a onclick='getAllGames(1)'>首页</a></li>"));
		//上一页
		if(page.hasPreviousPage){
			ulEle.append($("<li><a onclick='getAllGames("+page.prePage+")'>上一页</a></li>"))
		}else{
			ulEle.append($("<li><a>上一页</a></li>").addClass("disabled"));
		}
		
		//构建连续页面
		var ns = page.navigatepageNums;
		$.each(ns,function(){
			if(page.pageNum == this){
				ulEle.append($("<li><a onclick='getAllGames("+this+")'>"+this+"</a></li>").addClass("active"))
			}else{
				ulEle.append($("<li><a onclick='getAllGames("+this+")'>"+this+"</a></li>"))
			}
		})
		//下一页
		if(page.hasNextPage){
			
			ulEle.append($("<li><a onclick='getAllGames("+page.nextPage+")'>下一页</a></li>"))
		}else{
			ulEle.append($("<li><a>下一页</a></li>").addClass("disabled"));
		}
		
		//末页
		ulEle.append($("<li><a onclick='getAllGames("+page.pages+")'>末页</a></li>")); 
		
		$("#pageBar_td").empty().append(ulEle);
		
	}
	function showGamesToTable(tabEle,data){
		tabEle.find("tbody").empty();
		$.each(data, function(){
			var status=this.status;
			var gameStatus ="";
			if (status ==1){
				gameStatus = "审核通过";
			}else{
				gameStatus = "审核不通过";
			}
			var tr = $("<tr></tr>")
						.append("<td>"+ this.id+"</td>")
						.append("<td>"+ this.name+"</td>")
						.append("<td>"+ this.version+"</td>")
						.append("<td>"+ this.tab+"</td>")
						.append("<td>"+gameStatus+"</td>")
			
			var detailBtn = $("<button type='button' g_id='"+this.id+"' class='btn btn-success btn-xs showimg'><i class='glyphicon glyphicon-check'></i></btton>")
			
			var editBtn = $("<button></button>").attr({type:"button"}).attr({e_id:this.id})
							.addClass("btn btn-success btn-xs")
							.append("<i class='glyphicon glyphicon-pencil'></i>")
			var delBtn = $("<button></button>")
							.attr({type:"button"}).attr({name:this.name}).attr({d_id:this.id})
							.addClass("btn btn-success btn-xs")
							.append($("<li></li>").addClass("glyphicon glyphicon-remove"))
							
			var btnTd = $("<tr></tr>")
							.append(detailBtn).append("&nbsp;").append(editBtn).append("&nbsp;").append(delBtn)
			btnTd.appendTo(tr);
			
			tabEle.find("tbody").append(tr);
		})
		
	}
	//页面加载完成后就调用
	$(function(){
	getAllGames(1);
		
	})
	
	//审核功能
	$("tbody").on("click",".glyphicon-pencil",function(){
		var c_id = $(this).parent("button").attr("e_id")
		$("#submitBtn").attr("c_id",c_id);
		$("#myModal").modal("show");
		
		
	})
	//查看游戏详细
	$("tbody").on("click",".showimg",function(){
		var g_id = $(this).attr("g_id")
		
		$.get("${ctp}/manager/game/getGame?id="+g_id,function(data){
			var imgSrc ="${ctp}/"+ data.imgurls
			
			console.log(data.name)
			var text1 = $(".g_name").text(data.name)
			$(".g_tab").text(data.tab)
			$("textarea").text(data.introduce)
			$(".g_showimg").prop("src",imgSrc)
			$("#myGameModal").modal("show");
		})
		$("#gameBtn").click(function(){
			$("#myGameModal").modal("hide");
		});
		
		
	})
	
	$("input:radio").click(function(){
		$("input:radio:checked").val();
		
	})
	//提交审核
	$("#submitBtn").click(function(){
		var checkValue = $("input:radio:checked").val();
		var checkId = $(this).attr("c_id");
		//alert(checkId)
		$.ajax({
			url:"${ctp}/manager/game/updateStatus?id="+checkId+"&status="+checkValue,
			type:"get",
			success:function(){
				layer.msg("【"+checkId+"】号游戏状态已修改")
			}
		})
		$("#myModal").modal("hide");
		getAllGames(1);
	})
	
	
	//删除游戏
	$("tbody").on("click",".glyphicon-remove",function(){
		var id=$(this).parent("button").attr("d_id");
		if(confirm("您确定要删除【"+$(this).parent("button").attr("name")+"】吗？")){
			location.href="${ctp}/manager/game/delete?id="+id;
			getAllGames(99999);
		}else{
			return false;
		}
		
		
	})	
	</script>
</body>
</html>
