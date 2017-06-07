function alarm_access(){  
	var xhttp;    
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var alarm_msg = this.responseText; 
			alert(this.responseText.find("body"));
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
	count = 0;
	if(document.getElementById("alarm_count_in") != null){
		count = document.getElementById("alarm_count_in").innerHTML;
	}
	if(count==0){
		document.getElementById("alarm_count").style.display = 'none';
	}else{
		document.getElementById("alarm_count").style.display = 'block';
		document.getElementById("alarm_count").innerHTML = count;
	}
}

function alert_view(alarm_msg){
	document.getElementById("alert_box").innerHTML = alarm_msg;
}

function onAlarm(num){
	url = location.href;
	location.href='OnAlarm.al?num='+num+'&url='+url;
}

function offAlarm(num){
	url = location.href;
	location.href='OffAlarm.al?num='+num+'&url='+url;
}




