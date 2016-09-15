<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'sb-admin.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'header.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">

	<head>
	<!-- Navigation -->
	<div class="grailsLogo" role="banner">
    	<nav class="navbar navbar-inverse" role="navigation">
        
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="/music_shoppa/"><g:message code="label.title"></g:message></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/music_shoppa/products/"><g:message code="label.product_page"></g:message></a>
                    </li>
                    <li>
                        <a href="/music_shoppa/contactForm"><g:message code="label.contact"></g:message></a>
                    </li>
                </ul>
                <ul class="nav navbar-nav" style="float: right">
                	<sec:ifAnyGranted roles="ROLE_USER">
                		<li>
                			<a href="/music_shoppa/products/cart/"><g:message code="label.cart"></g:message></a>
                		</li>
                	</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_ADMIN">
						<li>
							<a href="/music_shoppa/SecUser/"><g:message code="label.user"></g:message></a>
						</li>
					</sec:ifAnyGranted>
                	<sec:ifNotLoggedIn>
	                	<li>
	                        <a href="/music_shoppa/login/"><g:message code="label.login"></g:message></a>
	                    </li>
                	</sec:ifNotLoggedIn>
                	<sec:ifLoggedIn>
	                	<li>
	                        <a href="/music_shoppa/logout"><g:message code="label.logout"></g:message></a>
	                    </li>
                	</sec:ifLoggedIn>
                    <li>
                        <a href="?lang=pl">PL</a>
                    </li>
                    <li>
                        <a href="?lang=en">EN</a>
                    </li>
                    <li>
                        <a href="?lang=de">DE</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
       
        <!-- /.container -->
        </nav>
         </div>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
				    
		<g:layoutHead/>
	</head>
	<body>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
