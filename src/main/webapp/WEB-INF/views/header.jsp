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
	var page = function (pageName) {
		if(global.pageName != pageName){ // 처음로딩될때 두번호출되는것 방지
			document.querySelector("#" + global.pageName).style = "display:none";
		}
		global.pageName = pageName;
		document.querySelector("#" + pageName).style = "display:block";
	};
</script>

<body>
	<!-- 헤더 -->
	<input type="hidden" id="pageName" name="pageName" value="${pageName}" />
	<script type="text/javascript">
		$(function() {
			global.pageName = document.querySelector("#pageName").value;
			page(global.pageName);
			global.loginId = document.querySelector("#loginId").value;
			console.log(global.loginId);
		});
	</script>

	<div style="margin-bottom: 60px;">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" onclick='page("roomList")'>Web chatting</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="mr-auto"></div>
					<form class="form-inline my-2 my-lg-0">
						<input type="hidden" id="loginId" value="${loginid.id}">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link"
								onclick='page("notice")'>공지사항</a></li>
							<c:if test="${loginid.id != null }">
								<li class="nav-item"><a class="nav-link"
									onclick='page("loginForm")'>마이페이지</a></li>
								<li class="nav-item"><a class="nav-link"
									href='/logout'>로그아웃</a></li>
							</c:if>
							<c:if test="${loginid.id == null }">
								<li class="nav-item"><a class="nav-link"
									onclick='page("loginForm")'>로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									onclick='page("joinForm")'>회원가입</a></li>
							</c:if>
						</ul>
					</form>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>