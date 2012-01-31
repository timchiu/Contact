

<%@ page import="com.fycd.contact.TaoCenter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoCenter.label', default: 'TaoCenter')}" />
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
            <g:hasErrors bean="${taoCenterInstance}">
            <div class="errors">
                <g:renderErrors bean="${taoCenterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${taoCenterInstance?.id}" />
                <g:hiddenField name="version" value="${taoCenterInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="taoCenter.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoCenterInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${taoCenterInstance?.name}" />
                                </td>
							
                        
							
                                <td valign="top" class="name">
                                  <label for="leaders"><g:message code="taoCenter.leaders.label" default="Leaders" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoCenterInstance, field: 'leaders', 'errors')}">
                                    <g:select name="leaders" from="${com.fycd.contact.TaoMember.list()}" multiple="yes" optionKey="id" size="5" value="${taoCenterInstance?.leaders*.id}" />
                                </td>
							
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="regions"><g:message code="taoRegion.label" default="Regions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoCenterInstance, field: 'regions', 'errors')}">
                                    
<ul>
<g:each in="${taoCenterInstance?.regions?}" var="r">
    <li><g:link controller="taoRegion" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="taoRegion" action="create" params="['taoCenter.id': taoCenterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'taoRegion.label', default: 'TaoRegion')])}</g:link>

                                </td>
							
								<td valign="top" class="name"/>
								<td valign="top" class="value"/>
                        
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
