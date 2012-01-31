
<%@ page import="com.fycd.contact.ContactRecord" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactRecord.label', default: 'ContactRecord')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'contactRecord.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'contactRecord.dateCreated.label', default: 'Date Created')}" />
                        
                            <th><g:message code="contactRecord.createdBy.label" default="Created By" /></th>
                        
                            <g:sortableColumn property="description" title="${message(code: 'contactRecord.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'contactRecord.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactRecordInstanceList}" status="i" var="contactRecordInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactRecordInstance.id}">${fieldValue(bean: contactRecordInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${contactRecordInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: contactRecordInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: contactRecordInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${contactRecordInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactRecordInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
