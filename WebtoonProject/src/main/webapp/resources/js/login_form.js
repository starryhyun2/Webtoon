		function send(f){
			
			var id = f.id.value;
			var pwd = f.pwd.value;
			var prevPage = f.prevPage.value;
			
			if( id == '' ){
				alert("아이디를 입력하세요");
				return;
			}
			
			if( pwd == '' ){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			//Ajax로 ID와 PWD를 전달
			var url = "login_check.do";
			var param = "id="+id+"&pwd="+pwd;
			sendRequest(url, param, resultFn, "POST");
		
		}
		
		function resultFn(){
			const prevPage = document.getElementById('prevPage');
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
				
				alert("로그인 성공");
				location.href=prevPage.value;
			}
			
		}
		