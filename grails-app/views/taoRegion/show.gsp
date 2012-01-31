
<%@ page import="com.fycd.contact.TaoRegion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoRegion.label', default: 'TaoRegion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="taoRegion.info.label" default="Tao Region Info" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoRegion.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoRegionInstance, field: "name")}</td>
						
                            <td valign="top" class="name"><g:message code="taoRegion.primaryLeader.label" default="Primary Leader" /></td>
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${taoRegionInstance?.primaryLeader?.id}">${taoRegionInstance?.primaryLeader?.encodeAsHTML()}</g:link></td>
                        </tr>
						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoRegion.backupLeader.label" default="Backup Leader" /></td>
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${taoRegionInstance?.backupLeader?.id}">${taoRegionInstance?.backupLeader?.encodeAsHTML()}</g:link></td>
                            
                            <td valign="top" class="name"><g:message code="contactGroup.label" default="Groups" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${taoRegionInstance.groups}" var="g">
                                    <li><g:link controller="contactGroup" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
						
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${taoRegionInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
