<%--
 select dla wszystkich produktów
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
  <sql:setDataSource var = "baza"
       driver = "com.mysql.jdbc.Driver"
       url = "jdbc:mysql://db4free.net:3306/sdabase?serverTimezone=UTC"
       user = "sdauser"  password = "MySQL2020"/>
  <sql:query dataSource = "${baza}" var = "result">
    SELECT * from products;
  </sql:query>
  <h3>Lista produktów w formie tabelarycznej</h3>
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
