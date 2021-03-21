<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<script type="text/javascript">

	/**
	 * 채팅방 생성 팝업
	 */
	let subject_onclick = (id) =>{
		if (global.loginId != null && global.loginId != ""){
			window.open('/chat?roomId='+ id, 'windo', 'width=820,height=490,left=' + popupX2 + ',top='+ popupY2);
		}else{
			alert("먼저 로그인 해주시기 바랍니다.");
		}
	};
	
	/**
	 * 페이징 처리
	 */
	let room_paging = (page, pageCount, totCount) => {
		
		let totPage = parseInt(totCount / pageCount) + 1;
		let startPage = page - page%pageCount  +1;
		
		//startpage 예외처리
		startPage -= page%pageCount == 0 ? pageCount : 0;
		
		let endPage = startPage + pageCount -1;
		
		//endpage가 totpage보다 크면 안된다.
		endPage = endPage > totPage ? totPage : endPage;
		
		//previousPage가 1보다 작으면 안된다.
		let previousPage = startPage-1;
		previousPage = 1 > previousPage ? 1 : previousPage;
		
		//nextPage가 totpage보다 크면 안된다.
		let nextPage = endPage + 1;
		nextPage = nextPage > totPage ? totPage : nextPage;
		
		let pagination = "";
		let pagePrevious = '<li class="page-item">'+
		'<a class="page-link" onclick="room_search('+ previousPage +')" aria-label="Previous">'+
		'<span aria-hidden="true">&laquo;</span>' +
		'</a>'+
		'</li>';
		let pageNext = '<li class="page-item">' +
		'<a class="page-link" onclick="room_search('+ nextPage +')"aria-label="Next">'+
		'<span aria-hidden="true">&raquo;</span>'+
		'</a>'+
		'</li>';
		
		pagination += pagePrevious
		for(let i = startPage; i<= endPage; i++){
			let pageItem = '<li class="page-item"><a class="page-link" onclick="room_search('+ i +')">'+ i +'</a></li>';
			pagination += pageItem;
		}
		pagination += pageNext;
		
		document.querySelector('#room_paging').innerHTML=pagination;
	};
	
	/**
	 * 채팅방 조회
	 */
	let room_search = (page) => {
		const option = {
				  url : 'http://localhost:8080/roomSearch',
				  method:'POST',
				  header:{
				     'Accept':'application/json',
				     'Content-Type':'application/json;charset=UTP-8'
				  },
				  data:{
					id : document.querySelector('#room_search_id').value,
					master : document.querySelector('#room_search_master').value,
					subject : document.querySelector('#room_search_subject').value,
				    length : 10,
				    start : (page-1) * 10
				  }
		};
		
		axios(option)
			.then(response => {
				
				//==방정보 화면에 보여주기==//
				let room = response.data.room;
				let tbody = "";
				room.forEach(e => {
					let id = e.id;
					let subject = e.subject;
					let master = e.master;
					
					let row = '<tr>' +
							'<td style="text-align: center;">'+ id +'</td>'+
							'<td> <b>'+
							'<a style="cursor: pointer;" onclick="subject_onclick('+id+')">' +
							subject + '</a> </b> </td>' +
							'<td>'+ master +'</td>' +
							'</tr>';
					tbody += row;
				});
				document.querySelector('#room_table_tbody').innerHTML=tbody;
				
				//==페이징 처리==//
				room_paging(page, 10, response.data.count);
			}).catch(response => console.log('Error!'));
	};
	
	/**
	 * 초기화
	 */
	let room_reset = () => {
		document.querySelector('#room_search_id').value="";
		document.querySelector('#room_search_master').value="";
		document.querySelector('#room_search_subject').value="";
	};
</script>

<div>
	<div>
		<!-- 검색조건 -->
		<table class="table table-bordered">
			<tr>
				<th class="table-light" style="width: 100px; text-align: right;">방번호</th>
				<td><input type="text" class="form-control form-control-sm"
					id="room_search_id" name="id" value=""></td>
				<th class="table-light" style="width: 100px; text-align: right;">방장</th>
				<td><input type="text" class="form-control form-control-sm"
					id="room_search_master" name="master" value=""></td>
			</tr>
			<tr>
				<th class="table-light" style="width: 100px; text-align: right;">제목</th>
				<td colspan="3"><input type="text"
					class="form-control form-control-sm" id="room_search_subject"
					name="subject" value=""></td>
			</tr>
			<tr>
				<td class="align-bottom" colspan="4" style="width: 150px;">
					<div style='float: right;'>
						<button class="btn btn-secondary" style='width: 100px'
							onclick='room_reset()'>초기화</button>
						<button class="btn btn-primary" style='width: 100px'
							onclick='room_search(1)'>조회</button>
					</div>
				</td>
			</tr>
		</table>


		<div style="height: 45px;">
			<c:if test="${loginid.id != null }">
				<button class=" btn btn-secondary"
					style="float: right; width: 100px;"
					onclick="window.open('./make', 'windo', 'width=750,height=530,left=' + popupX + ',top='+ popupY)">방만들기</button>
			</c:if>
		</div>


		<!-- 검색결과 -->
		<div>
			<table class="table table-bordered" id="room_table">
				<thead class="table-active">
					<tr style="text-align: center;">
						<th width="10%">방 번호</th>
						<th width="75%">제목</th>
						<th width="15%">방장</th>
					</tr>
				</thead>
				<tbody id="room_table_tbody">
				</tbody>
			</table>
		</div>
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center" id="room_paging">
				</ul>
			</nav>
		</div>
	</div>
</div>