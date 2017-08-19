<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
changePageStyle("${curUrl}");
function changePageStyle(url){
//当前页面所在的那个超链接是color:red
//他的父list-group-item  tree-closed 是没有的
$("a[href='${ctp}/"+url+"']").css("color","red");
$("a[href='${ctp}/"+url+"']").parents(".list-group-item").removeClass("tree-closed");
$("a[href='${ctp}/"+url+"']").parent().parent("ul").show(100);
}
function checkall_reverse(check_all_btn,check_btn){
check_all_btn.click(function(){
	check_btn.prop("checked",$(this).prop("checked"));
});

check_btn.click(function(){
	var flag = check_btn.filter(":checked").length == check_btn.length ;
check_all_btn.prop("checked",flag);
})
}
</script>
