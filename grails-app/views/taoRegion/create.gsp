

<%@ page import="com.fycd.contact.TaoRegion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoRegion.label', default: 'TaoRegion')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <gui:resources components="['autoComplete']"/>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taoRegionInstance}">
            <div class="errors">
                <g:renderErrors bean="${taoRegionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="taoRegion.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoRegionInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${taoRegionInstance?.name}" />
                                </td>
							
                        
							
                                <td valign="top" class="name">
                                    <label for="primaryLeader"><g:message code="taoRegion.primaryLeader.label" default="Primary Leader" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoRegionInstance, field: 'primaryLeader', 'errors')}">
                                    <gui:autoComplete id="primaryLeader" controller="taoMember" action="autoCompleteTaoMember"/>
                                </td>
							
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                    <label for="backupLeader"><g:message code="taoRegion.backupLeader.label" default="Backup Leader" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoRegionInstance, field: 'backupLeader', 'errors')}">
                                    <gui:autoComplete id="backupLeader" controller="taoMember" action="autoCompleteTaoMember"/>
                                </td>
							
                                <td valign="top" class="name"/>
                        		<td valign="top" class="value"/>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
