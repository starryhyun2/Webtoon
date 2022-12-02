
	function reply_send(wc) {
		const id = wc.id.value;
		const content = wc.content.value.trim();
		const episode_idx = wc.episode_idx.value;
		//유효성 체크

		if (id == null) {
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		} else if (id == '') {
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		}

		if (content == '') {
			alert("내용은 한글자 이상 넣어주세요.");
			return;
		}

		wc.action = "webtoon_reply_insert.do";
		//cb.method = "post";
		wc.submit();

	}

	function giveScore(f) {
		var score = f.score.value;
		var episode_idx = f.episode_idx.value;
		var id = f.id.value;
		
		if (id == null) {
			alert('로그인 한 후에 별점을 줄 수 있습니다.');
			return;
		} else if (id == '') {
			alert('로그인 한 후에 별점을 줄 수 있습니다.');
			return;
		}
		
		//Ajax로 ID와 PWD를 전달
		var url = "giveScore.do";
		var param = "score=" + score +"&episode_idx=" +episode_idx + "&id="+id;
		sendRequest(url, param, resultFn, "POST");
		
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//"{'result':'clear'}"
			var data = xhr.responseText;
			//서버에서 넘어온 데이터를 실제 JSON형식으로 변환
			var json = (new Function('return'+data))();
			if (json.result == 'already_id') {
				alert("별점을 수정했습니다.");
				return;
			} 
			alert("별점을 주었습니다!");
			return;
		}
	}
	
	function modify_send(f){
		//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
		if(window.confirm("이대로 변경하시겠습니까?") == true){
			f.action = "modify_wc.do";
			f.submit();
		}
	}
	function del_send(f){
		if(window.confirm("댓글을 삭제하시겠습니까?")){
			f.action="del_wc.do";
			f.submit();
		}
	}
		var modifyViews = document.getElementsByClassName('modifyViews')

		for (var i = 0; i < modifyViews.length; i++) {
			modifyViews[i].style.display = 'none'
		}

		function modifyCancle(idI) {
			var modifiId = document.getElementById(idI);
			modifiId.parentElement.parentElement.style.display = '';
			modifiId.parentElement.parentElement.nextElementSibling.style.display = 'none';

		}
		function modifyView(idI) {
			var modifiId = document.getElementById(idI);
			modifiId.parentElement.parentElement.style.display = 'none';
			modifiId.parentElement.parentElement.nextElementSibling.style.display = '';

		}

	function love_send(i){		
		
			var episode_idx = document.getElementsByName("episode_idx")[i-1].value;
			var id = document.getElementsByName("id")[i-1].value;
			var comments_idx = document.getElementsByName("comments_idx")[i-1].value;
			var love = document.getElementsByName("love")[i-1].value;
			
			if (id == null) {
			alert('로그인 한 후에 별점을 줄 수 있습니다.');
				return;
			} else if (id == '') {
				alert('로그인 한 후에 별점을 줄 수 있습니다.');
			return;
			}

			//Ajax로 ID와 PWD를 전달
			var url = "giveLove.do";
			var param = "episode_idx=" + episode_idx +"&comments_idx=" +comments_idx + "&id="+id +"&love=" +love;
			sendRequest(url, param, resultlove, "POST");
	}
	
	//현재 페이지를 유지하기 위해서 Ajax를 활용
	function resultlove() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var data = xhr.responseText;
			
			location.reload();
		}
	}

		
