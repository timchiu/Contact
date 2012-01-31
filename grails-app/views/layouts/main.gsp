<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
   <title><g:layoutTitle default="FYCD.US" /></title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <link rel="stylesheet" href="http://yui.yahooapis.com/2.8.0r4/build/reset-fonts-grids/reset-fonts-grids.css" type="text/css">
   <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
   <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
   <style type="text/css">
   #custom-doc { width:98.46em;*width:96.09em;min-width:1280px; margin:auto; text-align:left; }
   </style>
   <g:layoutHead />
   <!-- g:javascript library="application" /-->
   <nav:resources/>
</head>

<body class="yui-skin-sam">
<div id="doc3" class="yui-t7">
	<div id="hd" role="banner" style="font-size:2em;">
		<a href="http://fycd.us"><img src="${resource(dir:'images',file:'fycd.jpg')}" alt="FYCD.US" border="0" /></a>
		<a href="${createLink(uri: '/')}"><g:message code="app.name"/> <g:meta name="app.version"/></a>
		<div style="float:right;text-align:right; font-size:0.5em;margin-top:10px;">
			<shiro:guest>
			    [<a href="${createLink(uri: '/auth/login')}"><g:message code="login.label"/></a>]
			</shiro:guest>
			<shiro:user>
    			<g:message code="login.welcome.label"/> <shiro:principal/>!  <a href="${createLink(uri: '/auth/signOut')}"><g:message code="logout.label"/><a>
			</shiro:user>
		</div>
	</div>
   <div id="bd" role="main">
		<div id="menu" role="navigation" class="yui-g, center">
			<nav:render group="tabs" /> <shiro:user><g:render template="/layouts/search" /></shiro:user>
    	</div>
		<div id="bd" role="application" class="yui-g">
			<g:layoutBody />
		</div>

	</div>
   <div id="ft" role="contentinfo" style="text-align:center;margin-top:15px;"><p>&copy;2011 FYCD.US</p></div>
</div>
</body>
</html>