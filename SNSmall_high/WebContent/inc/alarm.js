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

function alarm_inner(alarm_msg){
	document.getElementById("alarm_list").innerHTML = alarm_msg;
}

function alert_view(alarm_msg){
	text = document.getElementById("alarm").innerHTML.trim();
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


