<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Praca z bazą danych SKLEP</title>
</head>
<body>
<h3>Lista wykonywanych czynności</h3>
<p>Pobranie wszystkich produktów z tabeli 'products' <a href="allProducts.jsp">allProducts.jsp</a> </p>
<p>Pobranie produktów z tabeli 'products' dla wybranej kategorii
    <form action="productsFromSelectedCategory.jsp" method="get">
        <select name="category" id = "category">
            <option value = "tools">tools</option>
            <option value = "plants">plants</option>
            <option value = "relax">relax</option>
        </select><br/>
    <label>Opis produktu</label>
    <input name="description" id="description" type="text"/>
    <input type="submit" value="Wybierz">
    </form>
</p>
<p>
    Zmiana kategorii ze 'spożywcze' na 'food' <a href="updateProducts.jsp">updateProducts.jsp</a>
</p>
<p>
    Przecena towarów w kategorii z 'food' <a href="przecena.jsp">przecena.jsp</a>
</p>
<p>Wstawienie nowego produktu do bazy danych
    <form action="insertNewProduct.jsp" method="post">
    <label>Nazwa produktu: </label>
    <input name="productName" type="text"/><br/>
    <label>Kategoria: </label>
    <select name="productCategory" id = "productCategory">
        <option value = "tools">tools</option>
        <option value = "plants">plants</option>
        <option value = "relax">relax</option>
    </select><br/>
    <label>Cena: </label>
    <input name="price" type="number"><br/>
    <label>Indeks produktu: </label>
    <input name="index" type="number">
    <input type="submit" value="Wybierz">
    </form>
</p>
<div>
    <%
        String oper = request.getParameter("operation");
        String desc = request.getParameter("description");
        if (oper != null) {
            out.print(oper + " : " + desc);
            System.out.println(desc);
        }
    %>
</div>
</body>
</html>