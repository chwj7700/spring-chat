<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
      .inputroom{
         width:250px;
         height:30px;
      }
   .roomButton{
          width:100px;
          
    background-color: #00AE8E;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left: 5px;
    
    cursor: pointer;
    border-radius:10px;
      }
   
   </style>
	<script>
	function aas(){
	var subject = document.getElementById("subject");
	if(subject.value=="")
		{
		alert("�������� �Է����ּ���");
		return false;
		}
	else
		return true;
	}
	</script>
</head>
<body bgcolor= "#fcfcfc";>


   <center>
<div style = "text-align : center; font-size:35px; display:table-cell; height:50px; vertical-align:middle;
    color:#00AE8E; font-weight:bold; border:1px solid #eaeaea;
    width:700px; background-color: white;">Spring Web Chatting</div><br/><br/>

 <div style=" width:700px; height:400px; border:1px solid #eaeaea; background-color: white;">
      <br/><br/><br/><br/><h4><font color="#ABABAB">ä�ù� �̸��� �Է����ּ���</font></h4>

   <form method="post" onsubmit="return aas();">
               
               <h4>�� ����</h4>
               
            <input id="subject" class="inputroom" type="text" name="subject" maxlength="10"
            		style="text-align : center; border-top:2px solid #ffffff;
            			  border-left:2px solid #ffffff; border-right:2px solid #ffffff;
            			   border-bottom:2px solid #eaeaea;">
           
            <input type="submit" id="btn" class="roombutton" value="�����" />
   </form>
    <c:if test="${msg==false}">
   <span style="color:#f00;">�� ������ �Է��� �ּ���!</span>
   </c:if>
   </div>
</center>
</body>
</html>