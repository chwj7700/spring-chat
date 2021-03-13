<%@ page import="org.springframework.ui.Model"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Websocket Client</title>
<link rel="stylesheet" href="resources/home.css" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var popupX = (window.screen.width / 2) - (750 / 2);
	var popupY= (window.screen.height / 2) - (530 / 2);
	var popupX2 = (window.screen.width / 2) - (820 / 2);
	var popupY2= (window.screen.height / 2) - (490 / 2);
</script>
</head>
<body>
	<jsp:include page="header.jsp" />


	<div class="container">

		<div id="joinForm" style="display: none;">
			<jsp:include page="joinForm.jsp" />
		</div>
		
		<div id="loginForm" style="display: none;">
			<jsp:include page="loginForm.jsp" />
		</div>
		
		<div>
			<div>
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
		</div>

		<div>
			<div>
				<div>
					<c:if test="${loginid.id != null }">
						<button class="mkroomButton"
							style="float: right; margin-top: 10px; margin-right: 15px; width: 100px; height: 100px;"
							onclick="window.open('./make', 'windo', 'width=750,height=530,left=' + popupX + ',top='+ popupY)">방만들기</button>
					</c:if>
				</div>


				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th style="text-align: center;">방 번호</th>
							<th>제목</th>
							<th>방장</th>
							<th>입장하기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="room" items="${room}">
							<tr>
								<td>${room.id}</td>
								<td>${room.subject}</td>
								<td>${room.master}
								<td><c:if test="${loginid.id != null }">
										<button class="inButton" style="height: 25px; width: 90px;"
											onClick="window.open('/chat?roomID=${room.id}', 'windo', 'width=820,height=490,left=' + popupX2 + ',top='+ popupY2)">입장</button>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="text-center">
					<ul class="pagination">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>