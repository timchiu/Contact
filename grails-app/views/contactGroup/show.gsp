
<%@ page import="com.fycd.contact.ContactGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactGroup.label', default: 'ContactGroup')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><!--  g:message code="default.show.label" args="[entityName]" / -->
            	<g:message code="contactGroup.info.label" default="Contact Group Info" />
            </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    

						
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactGroup.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: contactGroupInstance, field: "name")}</td>
                            
                            <td valign="top" class="name"><g:message code="contactGroup.leader.label" default="Leader" /></td>
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${contactGroupInstance?.leader?.id}">${contactGroupInstance?.leader?.encodeAsHTML()}</g:link></td>
                        </tr>
						
                    

						
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactGroup.members.label" default="Members" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${contactGroupInstance.members}" var="m">
                                    <li><g:link controller="taoMember" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                            <td valign="top" class="name"><g:message code="taoRegion.label" default="Tao Region" /></td>
                            <td valign="top" class="value"><g:link controller="taoRegion" action="show" id="${contactGroupInstance?.taoRegion?.id}">${contactGroupInstance?.taoRegion?.encodeAsHTML()}</g:link></td>
						
                        </tr>
						
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${contactGroupInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
