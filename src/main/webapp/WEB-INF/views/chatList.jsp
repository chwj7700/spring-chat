<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div>

		<c:if test="${loginid.id != null }">
			<div style="height: 45px;">
				<button class=" btn btn-secondary"
					style="float: right; width: 100px;"
					onclick="window.open('./make', 'windo', 'width=750,height=530,left=' + popupX + ',top='+ popupY)">방만들기</button>
			</div>
		</c:if>

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
										onclick="window.open('/chat?roomID=${room.id}', 'windo', 'width=820,height=490,left=' + popupX2 + ',top='+ popupY2)">${room.subject}</a>
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