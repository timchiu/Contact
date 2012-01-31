

<%@ page import="com.fycd.contact.ContactGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactGroup.label', default: 'ContactGroup')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <gui:resources components="['autoComplete']"/>
    </head>
    <body class="yui-skin-sam">
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${contactGroupInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactGroupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="contactGroup.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactGroupInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${contactGroupInstance?.name}" />
                                </td>
							
                        
							
                                <td valign="top" class="name">
                                    <label for="leader"><g:message code="contactGroup.leader.label" default="Leader" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactGroupInstance, field: 'leader', 'errors')}">
                                    <gui:autoComplete id="leader" controller="taoMember" action="autoCompleteTaoMember" value="${contactGroupInstance?.leader?.toString()}"/>
                                </td>
							
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                    <label for="taoRegion"><g:message code="taoRegion.label" default="Tao Region" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactGroupInstance, field: 'taoRegion', 'errors')}">
                                    <g:select name="taoRegion.id" from="${com.fycd.contact.TaoRegion.list()}" optionKey="id" value="${contactGroupInstance?.taoRegion?.id}"  />
                                </td>
							
                                <td valign="top" class="name" />
                                <td valign="top" class="value" />
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
