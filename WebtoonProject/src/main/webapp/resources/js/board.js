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
	
	function modify_board_form(f) {
	
	
	f.action = "modify_board_form.do";
	f.method = "get"
	f.submit();
	
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
		//게시판 글 수정
			function send_modify(f){
			
			var title = f.title.value;
			var id = f.id.value;
			var content = f.content.value.trim();
			var board_idx = f.board_idx.value;
			
			
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
			
			
			f.action = "modify_board.do";
			f.method = "post";
			f.submit();
			
		}
		//댓글삭제	
		function comments_del(f) {

		var comments_idx = f.comments_idx.value;
		var board_idx = f.ref.value;
		
		console.log(comments_idx);
		console.log(board_idx);
	
		// 삭제를 위한 게시글을 idx를 DB로 전달

		var url = "c_del";
		var param = "comments_idx="+comments_idx + "&board_idx="+board_idx;
		sendRequest(url, param, resultFn3, "post");

	}
	
	
	function resultFn3() {

		if (xhr.readyState == 4 && xhr.status == 200) {

			//"no" or "yes"
			var data = xhr.responseText;
			var json = (new Function('return'+data))();

			if (json.result == 'no') {

				alert("삭제 실패");
				return;
			}
			
			//alert("board_idx:" + json.b_idx);
			//alert("삭제 성공");
			location.href = "view.do?board_idx="+ json.b_idx;

		}

	}
		
		
		