<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.inputroom {
	width: 250px;
	height: 30px;
}

.roomButton {
	width: 100px;
	background-color: #00AE8E;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 5px;
	cursor: pointer;
	border-radius: 10px;
}
</style>

<script>
	let makeRoom_create = () =>{
		if(!makeRoom_createValidation()){
			return false;
		}
		
		const option = {
				  url : 'http://localhost:8080/roomCreate',
				  method:'POST',
				  header:{
				     'Accept':'application/json',
				     'Content-Type':'application/json;charset=UTP-8'
				  },
				  data:{
					subject : document.querySelector('#makeRoom_subject').value
				  }
		};
		
		axios(option)
		.then(response => {
			makeRoom_close();
			let roomId = response.data;
			roomList_makeCallback(roomId);
		}).catch(response => console.log('Error!'));
	};
	
	function makeRoom_createValidation() {
		var subject = document.getElementById("makeRoom_subject");
		if (subject.value == "") {
			alert("방제목을 입력해주세요");
			return false;
		} else
			return true;
	}
	
	let makeRoom_close = () => {
		document.querySelector('#makeRoom').style.display="none";
	}
</script>

<div id="makeRoom" class="modal">
		<!-- Modal content -->
		<div id="makeRoomContent" class="modal-content">
			<div>
				<button style="float: right" onclick='makeRoom_close()'>X</button>
			</div>
			<p></p>
			<div
				style="text-align: center; font-size: 35px; display: table-cell; height: 50px; vertical-align: middle; color: #000000; font-weight: bold; border: 1px solid #eaeaea; width: 700px; background-color: white;">Spring
				Web Chatting</div>
			<br /> <br />
			<div
				style="text-align: center; width: 700px; height: 400px; border: 1px solid #eaeaea; background-color: white;">
				<br /> <br /> <br /> <br />
				<h4>
					<font color="#ABABAB">채팅방 이름을 입력해주세요</font>
				</h4>
				<div>
					<h4>방 제목</h4>
					<input id="makeRoom_subject" class="inputroom" type="text" name="subject"
						maxlength="10"
						style="text-align: center; border-top: 2px solid #ffffff; border-left: 2px solid #ffffff; border-right: 2px solid #ffffff; border-bottom: 2px solid #eaeaea;">
					<button class="btn btn-secondary" style='width: 100px'
							onclick='makeRoom_create()'>만들기</button>
					<!-- <button id="btn" class="roomButton" onclick="makeRoom_create()">만들기</button> -->
				</div>
			</div>
	</div>
</div>