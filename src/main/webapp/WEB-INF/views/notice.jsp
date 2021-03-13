<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div>
		<c:if test="${loginid.id != null }">
			<button class="mkroomButton"
				style="float: right; margin-top: 10px; margin-right: 15px; width: 100px; height: 100px;"
				onclick="window.open('./makenotice', 'windo', 'width=750,height=530,left=' + popupX + ',top='+ popupY)">공지사항 작성</button>
		</c:if>
	</div>

	<div style="font-size: 30px; font-weight: bold;">Notice</div>
	<table>
		<c:forEach var="notice" items="${notice}">
			<tr>
				<td style="border-bottom: 1px solid #00AE8E;">
					${notice.comment}</td>
			</tr>
		</c:forEach>
	</table>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">First</th>
				<th scope="col">Last</th>
				<th scope="col">Handle</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
		</tbody>
	</table>

	<!-- 				<div class="text-center"> -->
	<!-- 					<ul class="pagination"> -->
	<!-- 						<li><a href="#" aria-label="Previous"> <span -->
	<!-- 								aria-hidden="true">&laquo;</span> -->
	<!-- 						</a></li> -->
	<!-- 						<li><a href="#">1</a></li> -->
	<!-- 						<li><a href="#">2</a></li> -->
	<!-- 						<li><a href="#">3</a></li> -->
	<!-- 						<li><a href="#">4</a></li> -->
	<!-- 						<li><a href="#">5</a></li> -->
	<!-- 						<li><a href="#" aria-label="Next"> <span -->
	<!-- 								aria-hidden="true">&raquo;</span> -->
	<!-- 						</a></li> -->
	<!-- 					</ul> -->
	<!-- 				</div> -->
</div>