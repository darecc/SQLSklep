<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Produkty spożywcze</title>
  <meta charset="utf-8"/>
</head>
<body>
<sql:setDataSource var = "baza"
                   driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://db4free.net:3306/sdabase?serverTimezone=UTC"
                   user = "sdauser"  password = "MySQL2020"/>
<sql:update dataSource = "${baza}" var = "results">
  UPDATE products set price = price *0.95 where category = 'food';
</sql:update>
<p>Zmieniono: <c:out value="${results}"/> wierszy</p>
</body>
</html>
