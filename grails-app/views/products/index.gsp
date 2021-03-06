<%@ page import="com.dmcs.dszubert.Products" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'products.label', default: 'Products')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-products" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <sec:ifAnyGranted roles="ROLE_ADMIN">
		<div class="nav" role="navigation">
                <ul>

                    <li>

                            <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>

                    </li>
                </ul>
		</div>
        </sec:ifAnyGranted>
		<div id="list-products" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'products.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'products.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="picture" title="${message(code: 'products.picture.label', default: 'Picture')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'products.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productsInstanceList}" status="i" var="productsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productsInstance.id}">${fieldValue(bean: productsInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: productsInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: productsInstance, field: "picture")}</td>
					
						<td>${fieldValue(bean: productsInstance, field: "price")}</td>
	        			<td><a class="btn btn-primary" href="buy/${fieldValue(bean: productsInstance, field: "id")}"><g:message code="label.buy"/></a>
                    </td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
