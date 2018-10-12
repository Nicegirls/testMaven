function hideTag(){
	required = document.getElementsByClassName("required");
	for(var i=0;i<required.length;i++){
		required[i].style.display="none";
	}
}

function checkAccount(){
	var regAccount =/^[A-Za-z][A-Za-z0-9_]{2,29}$/;
	var account = document.getElementById("account").value;
	if(!regAccount.test(account)){
		required[0].style.display="block";
	}else{
		required[0].style.display="none";
	}
}

function checkPsw(){
	var regAccount =/^[A-Za-z][A-Za-z0-9_]{5,29}$/;
	var psw = document.getElementById("psw").value;
	if(!regAccount.test(psw)){
		required[1].style.display="block";
	}else{
		required[1].style.display="none";
	}
}
