
	var check = false;
	 
	function send(f) {
		var id = f.id.value;
		var pwd = f.pwd.value;
		var name = f.name.value;
		var user_email = f.user_email.value;
		var email_address = f.email_address.value;
		const email = user_email + '@' + email_address;
		if (check == false) {
			alert("아이디 중복체크를 하세요");
			return;
		}
		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		if (pwd == '') {
			alert("비밀번호를 입력하세요");
			return;
		}
		if (name == '') {
			alert("이름은 필수입니다.");
			return;
		}
		if (user_email == '' || email_address == '') {
			alert("이메일은 필수입니다.");
			return;
		}
		showLoading();

		
		//Ajax로 ID와 PWD를 전달
		var url = "sign_check.do";
		var param = "id=" + id + "&pwd=" + pwd + "&name=" + name + "&email="
				+ email;
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;
			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return'+data))();
			if (json.result == 'no_id') {
				hideLoading();
				return;
			} else if (json.result == 'no_pwd') {
				hideLoading();
				return;
			}
			hideLoading();
			location.href = "certifiacion_form";
		}
	}
	function dupli_check(f) {
		
		
		var id = f.id.value;
		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		//로딩 표시 
		showLoading();
		
		//Ajax로 ID와 PWD를 전달
		var url = "login_check.do";
		var param = "id=" + id;
		sendRequest(url, param, resultFn2, "POST");
	}
	function resultFn2() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;
			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return' + data))();
			if (json.result == 'no_pwd') {
				alert("아이디가 존재합니다.");
				check = false;
				
				hideLoading();
				return;
			} else {
				alert("이용가능한 아이디입니다.");
				check = true;
				document.getElementById('idBox').readOnly = true;
				
				hideLoading();
				return;
			}
		}
	}
	
const loading = document.getElementById('roadingStatus');
 
function clickedBtn(){ 
	// 로딩 표시 
	showLoading(); 
	// 로딩 숨기기(2초 후) 
	setTimeout("hideLoading()", 2000); 
} 

function showLoading(){ 
	//화면의 높이와 너비를 구합니다. 
	var maskHeight = $(document).height(); 
	var maskWidth = window.document.body.clientWidth; 
	//화면에 출력할 마스크를 설정해줍니다. 
	var mask ="<div id='mask' style='position:absolute; z-index:1000; background-color:#000000; left:0; top:0;'></div>"; 
	//화면에 레이어 추가 
	$('body') .append(mask) 
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다. 
	$('#mask').css({ 'width' : maskWidth ,'height': maskHeight ,'opacity' :'0.3' }); 
	$("#roadingStatus").show(); 
} 

function hideLoading(){ 
	$("#mask").remove(); 
	$("#roadingStatus").hide(); 
}
