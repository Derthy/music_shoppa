<%--
  Created by IntelliJ IDEA.
  User: ddsb
  Date: 14/09/2016
  Time: 12:45
--%>
<%@ page import="com.dmcs.dszubert.Products" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'products.label', default: 'Products')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<g:each in="${products}" status="i" var="product">
    <table>
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="cart" id="${product.id}">${fieldValue(bean: product, field: "name")}</g:link></td>

        <td>${fieldValue(bean: product, field: "description")}</td>

        <td>${fieldValue(bean: product, field: "picture")}</td>

        <td>${fieldValue(bean: product, field: "price")}</td>
        <td><a class="btn btn-primary" href="/music_shoppa/products/removeFromCart/${fieldValue(bean: product, field: "id")}"><g:message code="label.remove"/></a>

    </tr>
    </table>
</g:each>
</body>
</html>