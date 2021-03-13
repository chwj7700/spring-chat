<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="loginSucess" name="loginSucess"
	value="${loginSucess}" />
<script type="text/javascript">
	$(function() {
		let loginSucess = document.querySelector("#loginSucess").value;
		if (loginSucess == "false") {
			alert("아이디, 비밀번호를 확인해주세요.");
		}
	});
</script>


<form method="post" action="login">
	<div class="form-group row">
		<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="loginForm_id" name="id"
				value="">
		</div>
	</div>

	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
		<div class="col-sm-4">
			<input type="password" id="loginFrom_password" name="pw"
				class="form-control">
		</div>
	</div>

	<div class="form-group row">
		<div class="col-sm-6">
			<button type="submit" class="btn btn-primary btn-lg btn-block">login</button>
		</div>
	</div>
</form>
