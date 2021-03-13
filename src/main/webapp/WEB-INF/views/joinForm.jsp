<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<form method="post" action="join">
	<div class="form-group row">
		<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="id" name="id"
				value="">
		</div>
	</div>

	<div class="form-group row">
		<label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="loginForm_name"
				name="name" value="">
		</div>
	</div>

	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
		<div class="col-sm-4">
			<input type="password" id="loginForm_pw" name="pw"
				class="form-control">
		</div>
	</div>

	<div class="form-group row">
		<div class="col-sm-6">
			<button type="submit" class="btn btn-primary btn-lg btn-block">Sign
				in</button>
		</div>
	</div>
</form>
