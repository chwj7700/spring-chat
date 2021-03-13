<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS파일 -->
<link rel="stylesheet" href="resources/header.css">

<script type="text/javascript">
	var data = {};
	data.pageName = "joinForm";
	
	var page = function page(pageName) {
		document.querySelector(data.pageName).style = "display:none";
		data.pageName = pageName;
		document.querySelector("#"+pageName).style = "display:block";
	};
</script>

<body>
	<!-- 헤더 -->
	<div style ="margin-bottom: 60px;">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="/">Web chatting</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="mr-auto"></div>
					<form class="form-inline my-2 my-lg-0">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link"
								onclick='page("notice")'>공지사항</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick='page("loginForm")'>마이페이지</a></li>
							<li class="nav-item"><a class="nav-link" onclick='page("loginForm")'>로그인</a></li>
							<li class="nav-item"><a class="nav-link" onclick='page("joinForm")'>회원가입</a></li>
						</ul>
					</form>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>