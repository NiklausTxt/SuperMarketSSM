function search2(){
	var type = document.getElementById('search-mode').value;
	alert("asd");
	var kw = $("#inp-search").val();
	var currentPath = $("#currentPath").val();
	alert(currentPath);
	/*var url = "search_result.jsp?type=" + type + "&key=" + encodeURIComponent(kw);*/
    var hint = $("#inp-search").attr("placeholder");
    if(kw == null || kw == "" || kw == hint) {
        alert(hint);
        return false;
    }
    $.ajax({
		type : "POST",
		url : currentPath+"/searchResult.action",
		data : {"type":type,"key":kw},
		
		timeout : 20000,
		async:false,
		error : function() {
			alert("error");
			
		},
		success:function(goodsList){
			alert("success");
			alert(goodsList);
			window.location.href = currentPath+"frontpage/search_result.jsp";
		},

	});

}

function satrtSearch(value){
	alert(value);
	var currentPath = $("#currentPath").val();
	$.ajax({
		type : "POST",
		url : currentPath+"/listGoods.action",
		data : {"type":value},
		
		timeout : 20000,
		async:false,
		error : function() {
			alert("error");
			
		},
		success:function(){
			alert("success");
			window.location.href = currentPath+"frontpage/list.jsp";
		},

	});
}