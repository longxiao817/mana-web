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
                  <th>登入账户</th>
                  <th>密码</th>
                  <th>性别</th>
                </tr>
              </thead>
              	<tbody>
              	<c:forEach items="${list }" var="user">
	                <tr>
	                  <td>${user.userId }</td>
					  <td><input type="checkbox"></td>
	                  <td>${user.loginAcct }</td>
	                  <td>${user.passwd }</td>
	                  <td>${user.gender }</td>
	                  <td>
					      <button type="button" class="btn btn-success btn-xs assignRole" data-toggle="modal" data-target="#myModal" uid="${user.userId }"><i class=" glyphicon glyphicon-check"></i></button>
					      <button type="button" class="btn btn-primary btn-xs update" data-toggle="modal" data-target=".bs-example-modal-lg" uid="${user.userId }"><i class=" glyphicon glyphicon-pencil"></i></button>
						  <button type="button" class="btn btn-danger btn-xs del" uid="${user.userId }"><i class=" glyphicon glyphicon-remove"></i></button>
					  </td>
	                </tr>
                </c:forEach>
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
							<li ><a href="${ctp }/permission/user/user?pageNum=${pageInfo.navigateFirstPage}">第一页</a></li>
				
								<c:if test="${pageInfo.hasPreviousPage }">
									<li ><a href="${ctp }/permission/user/user?pageNum=${pageInfo.pageNum-1}">上一页</a></li>
								</c:if>		
							
								<c:forEach items="${ pageInfo.navigatepageNums}" var="pn">
									<c:if test="${pn==pageInfo.pageNum }">
										<li class="active"><a href="#">${pn } <span class="sr-only">(current)</span></a></li>
									</c:if>
									<c:if test="${pn!=pageInfo.pageNum }">
										<li><a href="${ctp }/permission/user/user?pageNum=${pn}">${pn }</a></li>
									</c:if>
								</c:forEach>
							
								<c:if test="${pageInfo.hasNextPage }">
									<li ><a href="${ctp }/permission/user/user?pageNum=${pageInfo.pageNum+1}">下一页</a></li>
								</c:if>		
							
							<li ><a href="${ctp }/permission/user/user?pageNum=${pageInfo.navigateLastPage}">尾页</a></li>	
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
	        <h4 class="modal-title" id="myModalLabel">分配角色</h4>
	      </div>
	      <div class="modal-body">
	        <div class="panel panel-default">
			  <div class="panel-body">
				<form role="form" class="form-inline">
				  <div class="form-group">
					<label for="exampleInputPassword1">未分配角色列表</label><br>
					<select class="form-control unRoleList" multiple size="10" style="width:100px;overflow-y:auto;">
                    </select>
				  </div>
				  <div class="form-group">
                        <ul>
                            <li class="btn btn-default glyphicon glyphicon-chevron-right rightMove"></li>
                            <br>
                            <li class="btn btn-default glyphicon glyphicon-chevron-left leftMove" style="margin-top:20px;"></li>
                        </ul>
				  </div>
				  <div class="form-group" style="margin-left:40px;">
					<label for="exampleInputPassword1">已分配角色列表</label><br>
					<select class="form-control assignRoleList" multiple size="10" style="width:100px;overflow-y:auto;">
                    </select>
				  </div>
				</form>
			  </div>
			</div>
        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary saveAssignRole" uid="">Save changes</button>
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
	        <h4 class="modal-title" id="myModalLabel">修改用户资料</h4>
	      </div>
	      <div class="modal-body">
	        <div class="panel panel-default">
			  <div class="panel-body">
				<table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox"></th>
                  <th>登入账户</th>
                  <th>密码</th>
                  <th>性别</th>
                </tr>
              </thead>
	                <tr>
	                  <td><input class="userId" disabled="disabled" ></td>
					  <td><input type="checkbox"></td>
	                  <td><input class="loginAcct" ></td>
	                  <td><input class="passwd" ></td>
	                  <td><input class="gender" ></td>
	                </tr>
              </table>
			  </div>
			</div>
        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary saveUser" uid="" data-dismiss="modal">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <%@include file="/include/jquery-file.jsp" %>
	<script >
		$(function(){
			var uid=null;
			
			$(".assignRole").click(function(){
				uid=$(this).attr("uid");
				$(".saveAssignRole").attr("uid",uid);
				
				$.ajax({
					url:"${ctp}/permission/user/assignRole?uid="+uid,
					dataType:"json",
					type:"get",
					success:function(data){
								    
					    var map=eval(data);
					    $(".unRoleList").empty();
					    $(".assignRoleList").empty();
					   	for(var i in map.unRole){
					   		
						   	$(".unRoleList").append("<option value='"+map.unRole[i].id+"'>"+map.unRole[i].name+"</option>");
						}
					   	for(var i in map.assignRole){
					   		
						   	$(".assignRoleList").append("<option value='"+map.assignRole[i].id+"'>"+map.assignRole[i].name+"</option>");
						}
					}
				})	
			});
			
			$(".rightMove").click(function(){
				$(".assignRoleList").append($(":selected"));
				$(".unRoleList").remove($(":selected"));
			});
			
			$(".leftMove").click(function(){
				$(".unRoleList").append($(":selected"));
				$(".assignRoleList").remove($(":selected"));
			});
			
			$(".saveAssignRole").click(function(){
				uid = $(this).attr("uid");
				var rids = "";
				
				$(".assignRoleList :enabled").each(function(){
            		rids+=$(this).val()+",";
            	});
				rids = rids.substring(0,rids.length-1);
				$.get("${ctp}/permission/user/saveAssignRole?uid="+uid+"&rids="+rids,function(){
            		alert("success");
            		window.location.reload();
            	})
			});
			
			$(".update").click(function(){
				uid=$(this).attr("uid");
				$(".saveUser").attr("uid",uid);
				
				$.ajax({
					url:"${ctp}/permission/user/toUpdate?uid="+uid,
					dataType:"json",
					type:"get",
					success:function(data){
						$(".userId").val(data.userId);
		                $(".loginAcct").val(data.loginAcct);
		                $(".passwd").val(data.passwd);
		                $(".gender").val(data.gender);
					}
				})	
			});
			
			$(".saveUser").click(function(){
				uid = $(this).attr("uid");
				var user={
					"userId":$(".userId").val(),
					"loginAcct":$(".loginAcct").val(),
					"passwd":$(".passwd").val(),
					"gender":$(".gender").val()
				}
				
				var userStr=JSON.stringify(user);
						
				$.get("${ctp}/permission/user/saveUser?uid="+uid+"&userStr="+userStr,function(data){
					window.location.reload();
            	})
			});
			
			$(".del").click(function(){
				uid=$(this).attr("uid");
				if(confirm("是否确认删除该用户")){
					
					$.get("${ctp}/permission/user/del?uid="+uid,function(){
						alert("已删除");
						window.location.reload();
					})
				}
			})
			
			
		})
	</script>
</body>
</html>