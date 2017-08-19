<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/include/css-file.jsp"%>
<link rel="stylesheet" href="${ctp}/css/main.css">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul id="permissionTree" class="ztree"></ul>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">权限修改</h4>
		  </div>
		  <div class="modal-body">
					<button type="button" class="btn btn-success btn-xs add" data-toggle="modal" data-target="#myModal2" id="add">
						<i class=" glyphicon glyphicon-check "></i>
					</button>
					<button type="button" class="btn btn-primary btn-xs toupdate" data-toggle="modal" data-target="#myModal2" id="toupdate">
						<i class=" glyphicon glyphicon-pencil"></i>
					</button>
					<br>
					<button type="button" class="btn btn-danger btn-xs del" data-toggle="modal" data-target="#myModal2" id="del">
						<i class=" glyphicon glyphicon-remove"></i>
					</button>
		  </div>
	 	</div>
	 </div>

	<!-- Moda12 -->
	<div class="modal fade bs-example-modal-lg" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改角色资料</h4>
	      </div>
	      <div class="modal-body">
	        <div class="panel panel-default">
			  <div class="panel-body">
				<table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="10">#</th>
                  <th>父节点id</th>
                  <th>权限名称</th>
                  <th>权限图标</th>
                  <th>权限页面</th>
                </tr>
              </thead>
	                <tr>
	                  <td width="10"><input class="permissionId" disabled="disabled"></td>
	                  <td><input class="permissionPid" ></td>
	                  <td><input class="permissionName" ></td>
	                  <td><input class="permissionIcon" ></td>
	                  <td><input class="permissionUrl" ></td>
	                </tr>
              </table>
			  </div>
			</div>
        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary savePermission" data-dismiss="modal">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	 <%@include file="/include/jquery-file.jsp" %>
    <script type="text/javascript">
    var ztreeObject;
    var perid=null;
    
    $(function(){
    	initPermissionTree();	
    })
    
    function showIcon(treeId, treeNode) {
			$("#" + treeNode.tId + "_ico").removeClass();
			$("#" + treeNode.tId + "_ico").before("<span class='"+treeNode.icon+"'></span>");
		}
    
    function showEditBtn(treeId, treeNode){
		$("#"+treeNode.tId+"_a").nextAll("button").remove();
		var editBtn = $("<button type='button' class='btn btn-primary btn-xs editBtn' data-toggle='modal' data-target='#myModal'> <span class='glyphicon glyphicon-align-left' aria-hidden='true'></span></button>");
		
		$("#"+treeNode.tId+"_a").after(editBtn);
		$(".editBtn").attr("perName",treeNode.name);
		$(".editBtn").attr("ndoeLevel",treeNode.level);
		
		editBtn.click(function(){
			$(".add").attr("perName",$(this).attr("perName"));
			
			$(".del").attr("perName",$(this).attr("perName"));
			
			$(".toupdate").attr("perName",$(this).attr("perName"));
			
			if($(this).attr("ndoeLevel")==0){
				document.getElementById("add").style.display="block";
				document.getElementById("del").style.display="none";
			}
			
			if($(this).attr("ndoeLevel")==1){
				document.getElementById("add").style.display="none";
				document.getElementById("del").style.display="block";
			}
			
		});
	}
	
	function hideEditBtn(treeId, treeNode){
		$("#"+treeNode.tId+"_a").nextAll("button").remove();
	}
	   
    function initPermissionTree() {
		var setting = {
			data : {
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "pid",
				},
				key : {
					url : "haha"
				}
			},
			view : {
				//自定义显示的效果
				addDiyDom : showIcon,
				addHoverDom: showEditBtn,
				removeHoverDom: hideEditBtn
			},
			check : {
				enable : false
			}
		};
		
		$.getJSON("${ctp}/permission/role/json", function(nodes) {
			$.each(nodes, function() {
				if (this.pid == 0) {
					this.open = true;
				}
			})
			ztreeObject = $.fn.zTree.init($("#permissionTree"), setting,
					nodes);
		})
	}
    
    $(".toupdate").click(function(){
		var perName=$(this).attr("perName");
		
		$.ajax({
			url:"${ctp}/permission/permission/toUpdate?perName="+perName,
			dataType:"json",
			type:"get",
			success:function(data){
				console.log(data);
				$(".permissionId").val(data.id),
				$(".permissionPid").val(data.pid),
				$(".permissionName").val(data.name),
				$(".permissionIcon").val(data.icon),
				$(".permissionUrl").val(data.url),
				$(".savePermission").attr("perid",data.id)
			}
		})	
	});
    
    $(".savePermission").click(function(){
    	perid = $(this).attr("perid");
		var permission={
			"id":$(".permissionId").val(),
			"pid":$(".permissionPid").val(),
			"name":$(".permissionName").val(),
			"icon":$(".permissionIcon").val(),
			"url":$(".permissionUrl").val(),
		}
		
		var permissionStr=JSON.stringify(role);
				
		$.get("${ctp}/permission/permission/savePermission?perid="+perid+"&permissionStr="+permissionStr,function(){
			window.location.reload();
    	})
	});
	
	$(".del").click(function(){
		var perName=$(this).attr("perName");
		if(confirm("是否确认删除该权限")){
			
			$.get("${ctp}/permission/permission/del?perName="+perName,function(){
				alert("已删除");
				window.location.reload();
			})
	
		}
		
	})
	
	</script>
</body>
</html>