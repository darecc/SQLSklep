<%--
 select dla produktów ze wskazanej kategorii
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Wszystkie produkty</title>
  <meta charset="utf-8"/>
</head>
<body>
<%
  String kategoria = request.getParameter("category");
  String opis = request.getParameter("description");
  pageContext.setAttribute("category", kategoria);
  opis = opis.trim();
%>
<sql:setDataSource var = "baza"
                   driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost:3306/sklep?serverTimezone=UTC"
                   user = "root"  password = "admin"/>
<sql:query dataSource = "${baza}" var = "result">
  SELECT * from products where category = '<%=kategoria%>' AND name LIKE '%<%=opis%>%';
</sql:query>
<h3>Lista produktów w formie tabelarycznej z kategorii '${pageContext.getAttribute("category")}' oraz z opisem zawierającym: '<%=opis%>'</h3>
<table style =”border:"1px;">
  <tr>
    <th>Name</th>
    <th>Price</th>
    <th>category</th>
    <th>Image</th>
  </tr>
  <c:forEach var = "row" items = "${result.rows}">
    <tr>
      <td><c:out value = "${row.name}"/></td>
      <td><c:out value = "${row.price}"/></td>
      <td><c:out value = "${row.category}"/></td>
      <td>
        <a href="
                     <c:out value = "${row.imageURL}"/>
                   ">
          fotka
        </a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
