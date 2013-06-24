<%@ page import="com.fycd.contact.TaoMember" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoMember.label', default: 'TaoMember')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
			<shiro:hasAnyRoles name="admin, master">
	            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</shiro:hasAnyRoles>
            <span class="menuButton"><g:link class="edit" action="edit" id="${taoMemberInstance?.id}"><g:message code="default.button.edit.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><!-- g:message code="default.show.label" args="[entityName]" /-->
            	<g:message code="taoMember.info.label" default="Member Info" />
            </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
				<table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoMember.chineseName.label" default="Chinese Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "chineseName")}</td>
                            <td valign="top" class="name"><g:message code="taoMember.englishName.label" default="English Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "englishName")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoMember.phoneNumber.label" default="Phone Number" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "phoneNumber")}</td>
							<td valign="top" class="name"><g:message code="taoMember.email.label" default="Email" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "email")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoMember.gender.label" default="Gender" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "gender")}</td>
                            <td valign="top" class="name"><g:message code="taoMember.address.label" default="Address" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "address")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoMember.languages.label" default="Languages" /></td>
							<td valign="top" class="value">
                                <g:each in="${taoMemberInstance.languages}" var="l">
                                    ${l?.encodeAsHTML()}<br>
                                </g:each>
                            </td>
                            <td valign="top" class="name"><g:message code="taoMember.notes.label" default="Notes" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "notes")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoMember.taoReceivingDate.label" default="Tao Receiving Date" /></td>
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${taoMemberInstance?.taoReceivingDate}"/></td>
                            <td valign="top" class="name"><g:message code="taoMember.completedTaoSeminar.label" default="Completed Tao Seminar" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "completedTaoSeminar")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="taoMember.vegetarianDate.label" default="Vegetarian Date" /></td>
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${taoMemberInstance?.vegetarianDate}"/></td>
                            <td valign="top" class="name" />
                            <td valign="top" class="value" />
                        </tr>
                    </tbody>
                </table>
			</div>
			<br>

			<h1><g:message code="taoMember.history.label" default="Member History" /></h1>
            <div class="dialog">
				<table>
                    <tbody>
	                    <g:each in="${taoMemberInstance.contactRecords.sort {r1, r2 -> r2.dateCreated.compareTo(r1.dateCreated)}}" var="c">
	                        <tr class="prop">
	                            <td valign="top" class="name">On <g:formatDate format="yyyy-MM-dd h:mma" date="${c?.dateCreated}"/></td>
	                            <td valign="top" class="value">${c?.createdBy} <g:message code="taoMember.wrote.label" /> : ${c?.description}</td>
	                        </tr>
	                    </g:each>
                    </tbody>
                </table>
			</div>
			<br>

			<h1><g:message code="taoMember.new.contactrecord.label" default="Enter a New Record" /></h1>
			<g:form method="post" controller="contactRecord" action="saveFromForm">
                <g:hiddenField name="taoMemberInstance.id" value="${taoMemberInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <!-- td valign="top" class="name">
                                  <label for="description"><g:message code="contactRecord.description.label" default="Description" /></label>
                                </td -->
                                <td valign="top" class="value">
                                    <g:textArea name="description" cols="50" rows="5" value="Enter latest TaoMember info here..." onFocus="this.value=''; return false;"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="saveFromForm" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                </div>
            </g:form>
			<br>
        </div>
    </body>
</html>
