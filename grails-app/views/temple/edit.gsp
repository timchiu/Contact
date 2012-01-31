

<%@ page import="com.fycd.contact.Temple" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'temple.label', default: 'Temple')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${templeInstance}">
            <div class="errors">
                <g:renderErrors bean="${templeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${templeInstance?.id}" />
                <g:hiddenField name="version" value="${templeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
							
                            <tr class="prop">

                                <td valign="top" class="name">
                                  <label for="name"><g:message code="temple.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${templeInstance?.name}" />
                                </td>
							


							
                                <td valign="top" class="name">
                                  <label for="members"><g:message code="taoMember.label" default="Tao Members" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templeInstance, field: 'members', 'errors')}">
                                    
<ul>
<g:each in="${templeInstance?.members?}" var="m">
    <li><g:link controller="taoMember" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="taoMember" action="create" params="['temple.id': templeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'taoMember.label', default: 'TaoMember')])}</g:link>

                                </td>
							
                            </tr>
							
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
