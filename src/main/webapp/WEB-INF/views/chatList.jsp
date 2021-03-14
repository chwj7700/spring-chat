<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

//== restFull 하게 바꾸면 변경하는데 너무오래걸릴듯 ==//
	let search = function() {
		const option = {
				  url : 'http://localhost:8080/roomSearch',
				  method:'POST',
				  header:{
				     'Accept':'application/json',
				     'Content-Type':'application/json;charset=UTP-8'
				  },
				  data:{
					id : document.querySelector('#chat_search_id').value,
					master : document.querySelector('#chat_search_master').value,
					subject : document.querySelector('#chat_search_subject').value,
				    length : '10',
				    start : '0'
				  }
		};
		axios(option)
			.then(response => {
// 				let data = response.data;
// 				let tbody = "";
// 				data.foreach(e => {
// 					let id = e.id;
// 					let subject = e.subject;
// 					let master = e.master;
// 					let row = $("<tr/>").append(
// 			              $("<td/>").text(id); 
// 			              $("<td/>").text(subject);      
// 			              $("<td/>").text(master);
// 			            );
// 				})
		console.log(response.data);
			})
		    .catch(response => console.log('Error!'));
	};
</script>

<div>
	<div>
		<!-- 검색조건 -->
		<table class="table table-bordered">
			<tr>
				<th class="table-light" style="width: 100px; text-align: right;">방번호</th>
				<td><input type="text" class="form-control form-control-sm"
					id="chat_search_id" name="id" value=""></td>
				<th class="table-light" style="width: 100px; text-align: right;">방장</th>
				<td><input type="text" class="form-control form-control-sm"
					id="chat_search_master" name="master" value=""></td>
			</tr>
			<tr>
				<th class="table-light" style="width: 100px; text-align: right;">제목</th>
				<td colspan="3"><input type="text"
					class="form-control form-control-sm" id="chat_search_subject"
					name="subject" value=""></td>
			</tr>
			<tr>
				<td class="align-bottom" colspan="4" style="width: 150px;">
					<div style='float: right;'>
						<button class="btn btn-secondary" style='width: 100px'
							onclick='alert("초기화")'>초기화</button>
						<button class="btn btn-primary" style='width: 100px'
							onclick='search()'>조회</button>
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
			<table class="table table-bordered">
				<thead class="table-active">
					<tr style="text-align: center;">
						<th width="10%">방 번호</th>
						<th width="75%">제목</th>
						<th width="15%">방장</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="room" items="${room}">
						<tr>
							<td style="text-align: center;">${room.id}</td>
							<td><c:if test="${loginid.id != null }">
									<b> <a style="cursor: pointer;"
										onclick="window.open('/chat?roomId=${room.id}', 'windo', 'width=820,height=490,left=' + popupX2 + ',top='+ popupY2)">${room.subject}</a>
									</b>
								</c:if> <c:if test="${loginid.id == null }">
									<a>${room.subject}</a>
								</c:if></td>
							<td>${room.master}
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>