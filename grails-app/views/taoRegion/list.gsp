
<%@ page import="com.fycd.contact.TaoRegion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoRegion.label', default: 'TaoRegion')}" />
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
                            <g:sortableColumn property="name" title="${message(code: 'taoRegion.name.label', default: 'Name')}" />
                            <th><g:message code="taoRegion.primaryLeader.label" default="Primary Leader" /></th>
                            <th><g:message code="taoRegion.backupLeader.label" default="Backup Leader" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taoRegionInstanceList}" status="i" var="taoRegionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${taoRegionInstance.id}">${fieldValue(bean: taoRegionInstance, field: "name")}</g:link></td>
                        
                            <td>${fieldValue(bean: taoRegionInstance, field: "primaryLeader")}</td>
                        
                            <td>${fieldValue(bean: taoRegionInstance, field: "backupLeader")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${taoRegionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
