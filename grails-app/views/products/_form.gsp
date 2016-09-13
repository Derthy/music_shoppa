<%@ page import="com.dmcs.dszubert.Products" %>



<div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="products.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productsInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="products.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${productsInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="products.members.label" default="Members" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'picture', 'error')} required">
	<label for="picture">
		<g:message code="products.picture.label" default="Picture" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="picture" name="picture" />

</div>

<div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="products.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${productsInstance.price}" required=""/>

</div>

