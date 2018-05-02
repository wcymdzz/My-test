<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>网上聊天室</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
  </head>
 
      <frameset cols="213,*"  frameborder="no" border="0" framespacing="0">
        <frame src="left.jsp" name="leftFrame"  id="leftFrame"/> 
        <frameset rows="180,*" cols="*" frameborder="no" border="0" framespacing="0">
         <frame src="rl.jsp" name="topFrame" scrolling="auto" noresize="noresize" id="topFrame"/>
        <frame src="main.jsp" name="mainFrame" scrolling="auto" id="mainFrame"/>
      </frameset>
   </frameset>
  <body>
 
  </body>
</html>