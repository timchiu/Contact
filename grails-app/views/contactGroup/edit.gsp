

<%@ page import="com.fycd.contact.ContactGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactGroup.label', default: 'ContactGroup')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <gui:resources components="['autoComplete']"/>
    </head>
    <body class="yui-skin-sam">
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
            <g:hasErrors bean="${contactGroupInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactGroupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${contactGroupInstance?.id}" />
                <g:hiddenField name="version" value="${contactGroupInstance?.version}" />
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
                                  <label for="members"><g:message code="contactGroup.members.label" default="Members" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactGroupInstance, field: 'members', 'errors')}">
                                    
<ul>
<g:each in="${contactGroupInstance?.members?}" var="m">
    <li><g:link controller="taoMember" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="taoMember" action="create" params="['contactGroup.id': contactGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'taoMember.label', default: 'TaoMember')])}</g:link>

                                </td>
							
                        
							
                                <td valign="top" class="name">
                                  <label for="taoRegion"><g:message code="taoRegion.label" default="Tao Region" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactGroupInstance, field: 'taoRegion', 'errors')}">
                                    <g:select name="taoRegion.id" from="${com.fycd.contact.TaoRegion.list()}" optionKey="id" value="${contactGroupInstance?.taoRegion?.id}"  />
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
