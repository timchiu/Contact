

<%@ page import="com.fycd.contact.ContactRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactRecord.label', default: 'ContactRecord')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            <g:hasErrors bean="${contactRecordInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactRecordInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                    <label for="createdBy"><g:message code="contactRecord.createdBy.label" default="Created By" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRecordInstance, field: 'createdBy', 'errors')}">
                                    <g:select name="createdBy.id" from="${com.fycd.contact.TaoMember.list()}" optionKey="id" value="${contactRecordInstance?.createdBy?.id}"  />
                                </td>
							
                        
							
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="contactRecord.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRecordInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${contactRecordInstance?.description}" />
                                </td>
							
                            </tr>
							
                        
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
