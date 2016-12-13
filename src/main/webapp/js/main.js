window.onload=function() {
    (function(){
        if(!document.getElementsByClassName)
        {
           document.getElementsByClassName=function(className)
            {
                var ret=[];
                var bodyObj=document.getElementsByTagName("body")[0];
                var eleArray=bodyObj.getElementsByTagName("*");
                for(var i= 0,len=eleArray.length;i<len;i++)
                {
                    var classArray=eleArray[i].className.split(" ");
                    for(var j= 0,classLen=classArray.length;j<classLen;j++)
                    {
                        if(classArray[j] == className)
                        {
                            ret.push(eleArray[i]);
                        }
                    }
                }
                return ret;
            };
        }
    })();

    function getAttr(obj,attr)
    {
        return obj.currentStyle?obj.currentStyle[attr]:getComputedStyle(obj)[attr];
    }

    //spotlight
    (function(){
        var banner= $("#spotlight ul")[0];
        if(banner != null)
        {
            var liArray=banner.getElementsByTagName("li"),
                spanArray=document.getElementById("ul-banner-circle").getElementsByTagName("span"),
                len=liArray.length,
                timer,
                nowShow= 0;
            if(len>0)
            {
                for(var count= 0;count<len;count++)
                {
                    (function(obj)
                    {
                        obj.onmouseover=function()
                        {
                            clearInterval(timer);
                        };
                        obj.onmouseout=function()
                        {
                            clearInterval(timer);
                            play();
                        };
                    })(liArray[count]);
                    (function(obj,count)
                    {
                        obj.onclick=function()
                        {
                            clearInterval(timer);
                            $(liArray[nowShow]).fadeOut(500);
                            $(spanArray[nowShow]).css("backgroundColor","#828282");
                            nowShow = count;
                            $(liArray[nowShow]).fadeIn(1000);
                            $(spanArray[nowShow]).css("backgroundColor","#e53935");
                            play();
                        };
                    })(spanArray[count],count);
                }
            }
            else
            {
                return false;
            }
            function play()
            {
                timer=setInterval(function(){
                    move();
                },5000);
            }
            function move()
            {
                {$(liArray[nowShow]).fadeOut(500);}	
                $(spanArray[nowShow]).css("backgroundColor","#828282");
                if( (nowShow+1) == len)
                {
                    nowShow = 0;
                }
                else
                {
                    ++nowShow;
                }
                $(liArray[nowShow]).fadeIn(1000);
                $(spanArray[nowShow]).css("backgroundColor","#e53935");
            }
        }
	else{return false;}
        play();
    })();

    
	//search
	$("#search-type li").each(function(i){
		$(this).click(function(){
			$("#search-type li").removeClass("selected");
			$("#inp-search").val("");
			$("#search-mode").val($(this).attr("data-value"));
            $("#inp-search").attr("placeholder", $(this).attr("data-ph"));
            $("#inp-search").attr("data-url", $(this).attr("data-url"));
			$(this).addClass("selected");
		})
	});

};

function search(){
	var type = document.getElementById('search-mode').value;
	alert("bbb");
	var kw = $("#inp-search").val();
    var hint = $("#inp-search").attr("placeholder");
    if(kw == null || kw == "" || kw == hint) {
        alert(hint);
        return false;
    }
    $.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath }/searchResult.action",
		data : {"type":type,"key":kw},
		timeout : 20000,
		async:false,
		error : function() {
			alert("error");
			
		},
		success:function(data){
			alert("success");
		},

	});

}

//Search by Enter
$(function(){
    $('#inp-search').bind('keypress',function(event){
        if(event.keyCode == "13")    
        {
        	search2();
        }
    });
});

$(function(){
	var hasSelected = false;
	$("#search-type ul li").each(function(){
        var tmp = $(this).hasClass('selected');
        if(tmp == true){
        	hasSelected = tmp;
        }
	});
	if(hasSelected == false){
		$("#search-type ul li:first").addClass('selected');
	}
});
