
<%@ page import="com.fycd.contact.ContactRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactRecord.label', default: 'ContactRecord')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="contactRecord.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactRecordInstance, field: "id")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="contactRecord.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${contactRecordInstance?.createdBy?.id}">${contactRecordInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="contactRecord.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactRecordInstance, field: "description")}</td>
                            
						
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${contactRecordInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
