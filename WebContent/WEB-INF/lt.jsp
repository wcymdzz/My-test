<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
<script type="text/javascript">
  function Judge(){
    var s;
    s = chats.say.value;
    if(s==""){
        alert("���Բ���Ϊ��");
        return false;
    }
    return true;
  }
 </script>
</head>
<body>
<%
  response.setHeader("refresh","5");
  String sess_us, fy, tmp;
  request.setCharacterEncoding("gbk");
  sess_us = (String)session.getAttribute("sess_us");
  Date now = new Date();
  fy = request.getParameter("say");
  if(fy != ""){
    String ans = now.toString()+"   "+sess_us+"˵: "+fy+"<br>";
    if(application.getAttribute("app_fy")== ""){
        application.setAttribute("app_fy", ans);
    }
    else{
        tmp = (String)application.getAttribute("app_fy");
        ans = tmp + ans;
        application.setAttribute("app_fy", ans);
    }
  }
%>
<table border="1" width="800">
<tr><td><%=application.getAttribute("app_fy") %>
</table>

<form action="chat.jsp" method = "post" name = "chats">
  <textarea rows="3" cols="80" name = "say"></textarea><br>
  <input type = "submit" value = "����" onclick = "return Judge()"></input>

</form>
</body>
</html>