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
		<hr style="clear:both;">
    	<div class="table-responsive">
        	<table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox"></th>
                  <th>登入账户</th>
                  <th>生日</th>
                  <th>性别</th>
                  <th>手机号码</th>
                  <th>真实姓名</th>
                  <th>身份证号码</th>
                  <th>资质图片</th>       
                  <td>用户类型</td>
                  <th>认证状态</th>
                </tr>
              </thead>
              	<tbody>
              	<c:forEach items="${list }" var="user">
	                <tr>
	                  <td>${user.userId }</td>
					  <td><input type="checkbox"></td>
	                  <td>${user.loginAcct }</td>
	                  <td>${user.birth }</td>
	                  <td>${user.gender }</td>
	                  <td>${user.phone }</td>
	                  <td>${user.realName }</td>
	                  <td>${user.idCard }</td>
					  <td>${user.certUrl }</td>
	                  <td>${user.userType }</td>
	                  <td>${user.certification }</td>
	                  <td>
					      <button type="button" class="btn btn-success btn-xs cert" data-toggle="modal" data-target="#myModal" certUrl="${user.certUrl }"><i class=" glyphicon glyphicon-check"></i></button>
					      <button type="button" class="btn btn-primary btn-xs update" data-toggle="modal" data-target=".bs-example-modal-lg" uid="${user.userId }"><i class=" glyphicon glyphicon-pencil"></i></button>
					  </td>
	                </tr>
                </c:forEach>
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="12" align="center">
						<ul class="pagination">
							<li ><a href="${ctp }/serviceman/realname/list?pageNum=${pageInfo.navigateFirstPage}">第一页</a></li>
				
								<c:if test="${pageInfo.hasPreviousPage }">
									<li ><a href="${ctp }/serviceman/realname/list?pageNum=${pageInfo.pageNum-1}">上一页</a></li>
								</c:if>		
							
								<c:forEach items="${ pageInfo.navigatepageNums}" var="pn">
									<c:if test="${pn==pageInfo.pageNum }">
										<li class="active"><a href="#">${pn } <span class="sr-only">(current)</span></a></li>
									</c:if>
									<c:if test="${pn!=pageInfo.pageNum }">
										<li><a href="${ctp }/serviceman/realname/list?pageNum=${pn}">${pn }</a></li>
									</c:if>
								</c:forEach>
							
								<c:if test="${pageInfo.hasNextPage }">
									<li ><a href="${ctp }/serviceman/realname/list?pageNum=${pageInfo.pageNum+1}">下一页</a></li>
								</c:if>		
							
							<li ><a href="${ctp }/serviceman/realname/list?pageNum=${pageInfo.navigateLastPage}">尾页</a></li>	
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
	        <h4 class="modal-title" id="myModalLabel">资质资料展示</h4>
	      </div>
	      <div class="modal-body">
	        <div class="panel panel-default">
			  <div class="panel-body">
				<form id="pic" role="form" class="form-inline">
				  
				</form>
			  </div>
			</div>
        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
	        <h4 class="modal-title" id="myModalLabel">修改用户状态</h4>
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
                  <th>用户状态</th>
                </tr>
              </thead>
	                <tr>
	                  <td><input class="userId" disabled="disabled" ></td>
					  <td><input type="checkbox"></td>
	                  <td><input class="loginAcct" disabled="disabled" ></td>
	                  <td><input class="certification" ></td>
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
	<script type="text/javascript">
	$(function(){
		var uid=null;
		
		$(".cert").click(function(){
			var certUrl="";
			certUrl+=$(this).attr("certUrl");
			/* certUrl.substring(0,certUrl.length-1); */
			var certUrls = certUrl.split(",", 100);
			
			$.each(certUrls,function(){
				$("#pic").append("<img src='${ctp}"+this+"'>");
			})
				
		});
		
		$(".update").click(function(){
			uid=$(this).attr("uid");
			$(".saveUser").attr("uid",uid);
			
			$.ajax({
				url:"${ctp}/serviceman/realname/toUpdate?uid="+uid,
				dataType:"json",
				type:"get",
				success:function(data){
					$(".userId").val(data.userId);
	                $(".loginAcct").val(data.loginAcct);
	                $(".certification").val(data.certification);
				}
			})	
		});
		
		$(".saveUser").click(function(){
			uid = $(this).attr("uid");
			var user={
				"userId":$(".userId").val(),
				"loginAcct":$(".loginAcct").val(),
				"certification":$(".certification").val()
			}
			
			var userStr=JSON.stringify(user);
					
			$.get("${ctp}/serviceman/realname/saveUser?uid="+uid+"&userStr="+userStr,function(data){
				window.location.reload();
        	})
		});
		
	})
	</script>
</body>
</html>