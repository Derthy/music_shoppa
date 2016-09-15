
<%@ page import="com.dmcs.dszubert.Products" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'products.label', default: 'Products')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-products" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-products" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list products">
			
				<g:if test="${productsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="products.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="products.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productsInstance}" field="description"/></span>

				</li>
				</g:if>


				<g:if test="${productsInstance?.buyers}">
				<li class="fieldcontain">
					<span id="members-label" class="property-label"><g:message code="products.members.label" default="Members" /></span>

						<g:each in="${productsInstance.buyers}" var="m">
						<span class="property-value" aria-labelledby="members-label"><g:link controller="secUser" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${productsInstance?.picture}">
				<li class="fieldcontain">
					<span id="picture-label" class="property-label"><g:message code="products.picture.label" default="Picture" /></span>

				</li>
				</g:if>

				<g:if test="${productsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="products.price.label" default="Price" /></span>

						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productsInstance}" field="price"/></span>

				</li>
				</g:if>

			</ol>
			<g:form url="[resource:productsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
