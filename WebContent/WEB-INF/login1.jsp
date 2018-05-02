<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    <title>My JSP 'Feilong_login.jsp' starting page</title>  
      
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  
    <!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    -->  
  
  </head>  
  <body>  
    <%  
    String driverClass = "org.gjt.mm.mysql.Driver";  
    String url = "jdbc:mysql://localhost:3306/student";  
    String username = "test";  
    String password = "123"; 
    Class.forName(driverClass);//这步错可能是因为.jar包导入问题  
    Connection conn = DriverManager.getConnection(url,username,password);//这步错可能是因为数据库属性安全中的名、密码不对或SQL的IP端口不是‘1433’  
    PreparedStatement pStmt = conn.prepareStatement("select * from tb_user");  
           ResultSet rs = pStmt.executeQuery();  
                while(rs.next()){  
                      out.println("用户名： " + rs.getString(1)   
                             + " 密码： " + rs.getString(2));  
                }  
     rs.close();  
     pStmt.close();  
     conn.close();  
     %>  
  </body>  
</html> 