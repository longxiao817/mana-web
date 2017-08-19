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
<br>
	<hr style="clear:both;">
		<div class="table-responsive">
        	<table class="table  table-bordered">
        		<thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox"></th>
                  <th>名字</th>
                </tr>
              </thead>
              	<tbody>
              	<c:forEach items="${list }" var="role">
	                <tr>
	                  <td>${role.id }</td>
					  <td><input type="checkbox"></td>
	                  <td>${role.name}</td>

	                  <td>
					      <button type="button" class="btn btn-success btn-xs assignPermission" data-toggle="modal" data-target="#myModal" rid="${role.id }"><i class=" glyphicon glyphicon-check"></i></button>
					      <button type="button" class="btn btn-primary btn-xs update" data-toggle="modal" data-target=".bs-example-modal-lg" rid="${role.id }"><i class=" glyphicon glyphicon-pencil"></i></button>
						  <button type="button" class="btn btn-danger btn-xs del" rid="${role.id }"><i class=" glyphicon glyphicon-remove"></i></button>
					  </td>
	                </tr>
                </c:forEach>
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
							<li ><a href="${ctp }/permission/role/role?pageNum=${pageInfo.navigateFirstPage}">第一页</a></li>
				
								<c:if test="${pageInfo.hasPreviousPage }">
									<li ><a href="${ctp }/permission/role/role?pageNum=${pageInfo.pageNum-1}">上一页</a></li>
								</c:if>		
							
								<c:forEach items="${ pageInfo.navigatepageNums}" var="pn">
									<c:if test="${pn==pageInfo.pageNum }">
										<li class="active"><a href="#">${pn } <span class="sr-only">(current)</span></a></li>
									</c:if>
									<c:if test="${pn!=pageInfo.pageNum }">
										<li><a href="${ctp }/permission/role/role?pageNum=${pn}">${pn }</a></li>
									</c:if>
								</c:forEach>
							
								<c:if test="${pageInfo.hasNextPage }">
									<li ><a href="${ctp }/permission/role/role?pageNum=${pageInfo.pageNum+1}">下一页</a></li>
								</c:if>		
							
							<li ><a href="${ctp }/permission/role/role?pageNum=${pageInfo.navigateLastPage}">尾页</a></li>	
						</ul>
					 </td>
				 </tr>

			  </tfoot>
			 
            </table>
          </div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">分配权限</h4>
	      </div>
	      <div class="modal-body">
	        <div class="panel panel-default">
			  <div class="panel-body">
				<div class="zTreeground">
					<ul id="permissionTree" class="ztree"></ul>
				</div>
			  </div>
			</div>
        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary saveAssignPermission" rid="">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Moda2 -->
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
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox"></th>
                  <th>角色名称</th>
                </tr>
              </thead>
	                <tr>
	                  <td><input class="roleId" disabled="disabled"></td>
					  <td><input type="checkbox"></td>
	                  <td><input class="roleName" ></td>
	                </tr>
              </table>
			  </div>
			</div>
        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary saveRole" rid="" data-dismiss="modal">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <%@include file="/include/jquery-file.jsp" %>
    <script type="text/javascript">
    var ztreeObject;
    var rid=null;
    
    $(".saveAssignPermission").click(function(){
		var nodes = ztreeObject.getCheckedNodes(true);
		var permission_ids = "";
		$.each(nodes,function(){
			permission_ids += this.id+",";
		});
		
		permission_ids.substring(0,permission_ids.length-1);
		rid = $(this).attr("rid");
		
		$.get("${ctp}/permission/role/update?pids="+permission_ids+"&rid="+rid,function(){
			alert("权限分配成功");
			$('#permissModel').modal("hide");
		})
	});
    
    $(".assignPermission").click(function(){
    	initPermissionTree($(this).attr("rid"));
    	$('.saveAssignPermission').attr("rid",$(this).attr("rid"));
    })
    
    function showIcon(treeId, treeNode) {
			$("#" + treeNode.tId + "_ico").removeClass();
			$("#" + treeNode.tId + "_ico").before("<span class='"+treeNode.icon+"'></span>");
		}

	function checkcurPermisson(rid) {
		$.getJSON("${ctp}/permission/role/perm?rid=" + rid, function(data) {
			if(data==null){
				alert("错");
			}else{
				$.each(data, function() {
					var node = ztreeObject.getNodeByParam("id", this.id, null);
					ztreeObject.checkNode(node, true, false);
				})
			}
		})
	}
    
    function initPermissionTree(rid) {
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
				addDiyDom : showIcon
			},
			check : {
				enable : true
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
			checkcurPermisson(rid);
		})
	}
    
    $(".update").click(function(){
		rid=$(this).attr("rid");
		$(".saveRole").attr("rid",rid);
		
		$.ajax({
			url:"${ctp}/permission/role/toUpdate?rid="+rid,
			dataType:"json",
			type:"get",
			success:function(data){
				$(".roleId").val(data.id);
                $(".roleName").val(data.name);       
			}
		})	
	});
    
    $(".saveRole").click(function(){
		rid = $(this).attr("rid");
		var role={
			"id":$(".roleId").val(),
			"name":$(".roleName").val(),
		}
		
		var roleStr=JSON.stringify(role);
				
		$.get("${ctp}/permission/role/saveRole?rid="+rid+"&roleStr="+roleStr,function(data){
			window.location.reload();
    	})
	});
	
	$(".del").click(function(){
		rid=$(this).attr("rid");
		if(confirm("是否确认删除该用户")){
			
			$.get("${ctp}/permission/role/del?rid="+rid,function(){
				alert("已删除");
				window.location.reload();
			})
		}
	})
	</script>
</body>
</html>