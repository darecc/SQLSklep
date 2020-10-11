<%--
 sql insert
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Dodanie nowego produktu do bazy</title>
    <meta charset="utf-8"/>
  </head>
  <body>
  <%
    String name = request.getParameter("productName");
    System.out.println("pobrana nazwa" + name);
    String cate = request.getParameter("productCategory");
    String pric = request.getParameter("price");
    String inde = request.getParameter("index");
  %>
  <sql:setDataSource var = "baza"
     driver = "com.mysql.jdbc.Driver"
     url = "jdbc:mysql://localhost:3306/sklep?serverTimezone=UTC"
     user = "root"  password = "admin"/>
  <sql:update dataSource = "${baza}" var = "results">
    Insert into products (name, price, category, indexNum) values ('<%=name%>',<%=pric%>,'<%=cate%>',<%=inde%>);
  </sql:update>
  <p>Dodano: <c:out value="${results}"/> wierszy</p>
  <%
    response.sendRedirect("index.jsp?operation=Dodano produkt&description=" + name);
  %>
  </body>
</html>
