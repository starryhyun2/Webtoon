/** 게시판에 대한 js 파일
 * 
 */
	function reply_send(cb) {
		const id = cb.id.value;
		const content = cb.content.value.trim();
		const ref = cb.ref.value;
		//유효성 체크

		if(id==null){
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		}else if(id==''){
			alert('로그인 한 후에 글을 쓸 수 있습니다.');
			return;
		}

		if (content == '') {
			alert("내용은 한글자 이상 넣어주세요.");
			return;
		}

		cb.action = "reply_insert.do";
		//cb.method = "post";
		cb.submit();

	}

	function del(ff) {

		var board_idx = ff.board_idx.value;

		if (!confirm("삭제하시겠습니까?")) {
			return;
		}

		// 삭제를 위한 게시글을 idx를 DB로 전달

		var url = "del";
		var param = "board_idx="+board_idx;
		sendRequest(url, param, resultFn, "post");

	}

	function resultFn() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			//"no" or "yes"
			var data = xhr.responseText;

			if (data == 'no') {

				alert("삭제 실패");
				return;
			}

			alert("삭제 성공");
			location.href = "list.do";

		}

	}
	
	function send_check(f){
			
			var title = f.title.value;
			var id = f.id.value;
			var content = f.content.value.trim();
			
			
			
			//유효성 체크
			if( title == ''){
				alert("제목은 필수입니다.");
				return;
			}
			if(id == ''){
				alert("이름은 필수입니다.");
				return;
			}
			if( content == ''){
				alert("내용은 한글자 이상 넣어주세요.")
				return;
			}
			
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
			
		}