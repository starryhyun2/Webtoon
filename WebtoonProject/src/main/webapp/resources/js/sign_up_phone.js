	var check = false;
		function send(f){
			
			var id = f.id.value;
			var pwd = f.pwd.value;
			var name = f.name.value;
			var phonenum = f.phonenum.value;
			if (check == false) {
				alert("아이디 중복체크를 하세요");
				return;
			}
			if( id == '' ){
				alert("아이디를 입력하세요");
				return;
			}
			
			if( pwd == '' ){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			if( name == ''){
				alert("이름을 입력하세요.");
				return;
			}
			
			if( phonenum == ''){
				alert("휴대폰 번호는 필수 입니다.");
				return;
			}
			//Ajax로 ID와 PWD를 전달
			var url = "sign_check.do";
			var param = "id="+id+"&pwd="+pwd+"&name="+name+"&phonenum="+phonenum;
			sendRequest(url, param, resultFn, "POST");
			
		}
		
		function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				//"{'result':'clear'}"
				var data = xhr.responseText;
				
				//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
				var json = (new Function('return'+data))();
				
				if( json.result == 'no_id' ){
					alert("아이디가 존재하지 않습니다");
					return;
					
				}else if( json.result == 'no_pwd' ){
					alert("비밀번호 불일치");
					return;
				}
				
				location.href="certifiacion_form";
			}
			
		}
		function dupli_check(f){
			var id=f.id.value;
			
			if( id == '' ){
				alert("아이디를 입력하세요");
				return;
			}
			
			//Ajax로 ID와 PWD를 전달
			var url = "login_check.do";
			var param = "id="+id;
			sendRequest(url, param, resultFn2, "POST");
			
		}
		
		function resultFn2(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				//"{'result':'clear'}"
				var data = xhr.responseText;
				
				//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
				var json = (new Function('return'+data))();
				
				if( json.result == 'no_pwd' ){
					alert("아이디가 존재합니다.");
					return;
					
				}else {
					alert("이용가능한 아이디입니다.");
					check = true;
					document.getElementById('idBox').readOnly = true;
					return;
				}
				
			}
			
		}
		
		
	  const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}