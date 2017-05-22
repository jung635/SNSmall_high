function alarm_access(){  
 		var xhttp;    
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
                var alarm_msg = this.responseText;  
                alert_view(alarm_msg);  
			}
		};
		xhttp.open("GET", 'Alarm.al', true);
		xhttp.send();	
	   
  setTimeout("alarm_access()", 3000);//3초 마다 서버와 통신함  
  return false;  
}  
function alarm_view(){  
	var xhttp;    
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var alarm_msg = this.responseText;  
			alarm_inner(alarm_msg);  
		}
	};
	xhttp.open("GET", 'AlarmView.al', true);
	xhttp.send();	
	
	setTimeout("alarm_view()", 3000);//3초 마다 서버와 통신함  
	return false;  
}

/*$(document).ready(function(){
	//setInterval(function(){
        $.ajax({url: "AlarmView.al", success: function(result){
       	 //var e = $(result).find('찾으려는요소');
       	alarm_inner(result);
          var mesg = result;
          var div = $('#alarm_count');
          var mesg = $(result).find('#alarm_count').toString();
          alert(mesg);
       }});
	//},3000)

});*/


function alarm_inner(alarm_msg){
	document.getElementById("alarm_list").innerHTML = alarm_msg;
	count = document.getElementById("alarm_count_in").innerHTML;
	if(count==0){
		document.getElementById("alarm_count").style.display = 'none';
	}else{
		document.getElementById("alarm_count").style.display = 'block';
		document.getElementById("alarm_count").innerHTML = count;
	}
}

function alert_view(alarm_msg){
	text = document.getElementById("alarm").innerHTML.trim();

	//alert(count);
	//alert(text);
	if(text == 'nothing'){
		document.getElementById("alarm").style.display = 'none';
		document.getElementById("alarm").innerHTML = alarm_msg;
	}else{
		document.getElementById("alarm").style.display = 'block';
		document.getElementById("alarm").innerHTML = alarm_msg;
		text = document.getElementById("alarm").innerHTML.trim();
		if(text == 'nothing'){
			document.getElementById("alarm").style.display = 'none';
		}
	}
}
function insert(){
	location.href = "InsertAction.al";
}

function alarmViewMore(limit){
	limit = limit+2;
	location.href='AlarmList.al?limit='+limit;
}


