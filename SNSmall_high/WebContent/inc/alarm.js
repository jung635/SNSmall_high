

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
	   
  setTimeout("alarm_access()", 5000);//3초 마다 서버와 통신함  
  return false;  
}  
function alarm_view(){  
	var xhttp;    
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var alarm_msg = this.responseText;  
			//view_msg(alarm_msg);  
			document.getElementById("alarm_list").innerHTML = alarm_msg;
		}
	};
	xhttp.open("GET", 'AlarmView.al', true);
	xhttp.send();	
	
	return false;  
} 
function alert_view(alarm_msg){
	text = alarm_msg;
	//alert(text);
	if(alarm_msg == 'nothing'){
		document.getElementById("alarm").style.display = 'none';
	}else{
		document.getElementById("alarm").style.display = 'block';
		document.getElementById("alarm").innerHTML = alarm_msg;
	}
}
function insert(){
	location.href = "InsertAction.al";
}


