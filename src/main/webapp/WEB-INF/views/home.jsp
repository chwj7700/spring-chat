<%@ page import="org.springframework.ui.Model"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Websocket Client</title>
<link rel="stylesheet" href="resources/home.css" type="text/css" />
<link rel="stylesheet" href="resources/modal.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="resources/global.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	var popupX = (window.screen.width / 2) - (750 / 2);
	var popupY= (window.screen.height / 2) - (530 / 2);
	var popupX2 = (window.screen.width / 2) - (820 / 2);
	var popupY2= (window.screen.height / 2) - (490 / 2);
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container body">
		<div id="joinForm" style="display: none;">
			<jsp:include page="joinForm.jsp" />
		</div>

		<div id="loginForm" style="display: none;">
			<jsp:include page="loginForm.jsp" />
		</div>
		
		<div id="notice" style="display: none;">
			<jsp:include page="notice.jsp" />
		</div>

		<div id="roomList" style="display: none;">
			<jsp:include page="roomList.jsp" />
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>