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

<div>
	<jsp:include page="header.jsp" />
</div>

<div class="container">
		<form method="post" action="login">
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="id"
						name="id" value="email@example.com">
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-4">
					<input type="password" id="pw" name="pw" class="form-control"
						id="inputPassword">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-6">
					<button type="submit" class="btn btn-primary btn-lg btn-block">login</button>
				</div>
			</div>
		</form>
</div>

<div>
	<jsp:include page="footer.jsp" />
</div>