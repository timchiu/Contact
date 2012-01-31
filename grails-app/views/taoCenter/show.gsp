
<%@ page import="com.fycd.contact.TaoCenter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoCenter.label', default: 'TaoCenter')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="taoCenter.info.label" default="Tao Center Info" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    

						
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoCenter.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoCenterInstance, field: "name")}</td>
						
                            <td valign="top" class="name"><g:message code="taoCenter.leaders.label" default="Leaders" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${taoCenterInstance.leaders}" var="l">
                                    <li><g:link controller="taoMember" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
						
                    

						
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoRegion.label" default="Regions" /></td>
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${taoCenterInstance.regions}" var="r">
                                    <li><g:link controller="taoRegion" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                            <td valign="top" class="name"/>
							<td valign="top" class="value"/>
                        </tr>
						
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${taoCenterInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
