
<%@ page import="com.fycd.contact.TaoMember" %>
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
                            <td valign="top" class="name"><g:message code="taoMember.phoneNumber.label" default="Phone Number" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "phoneNumber")}</td>

                            <td valign="top" class="name"><g:message code="taoMember.username.label" default="Username" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "username")}</td>
                        </tr>
                        <tr class="prop">
							<td valign="top" class="name"><g:message code="taoMember.email.label" default="Email" /></td>
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "email")}</td>
                        </tr>
                        
                    </tbody>
                </table>
			</div>
			<br>

			<g:form method="post" controller="contactRecord" action="saveFromForm">
                <g:hiddenField name="taoMemberInstance.id" value="${taoMemberInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="contactRecord.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textArea name="description" cols="40" rows="5" value="Enter latest TaoMember info here..." />
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










			
			                
            <div class="dialog">
                <table>
                    <tbody>
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "id")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "username")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.chineseName.label" default="Chinese Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "chineseName")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.englishName.label" default="English Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "englishName")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.gender.label" default="Gender" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "gender")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.phoneNumber.label" default="Phone Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "phoneNumber")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "address")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "email")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.contactPerson.label" default="Contact Person" /></td>
                            
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${taoMemberInstance?.contactPerson?.id}">${taoMemberInstance?.contactPerson?.encodeAsHTML()}</g:link></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.contactGroup.label" default="Contact Group" /></td>
                            
                            <td valign="top" class="value"><g:link controller="contactGroup" action="show" id="${taoMemberInstance?.contactGroup?.id}">${taoMemberInstance?.contactGroup?.encodeAsHTML()}</g:link></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.birthDate.label" default="Birth Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taoMemberInstance?.birthDate}" /></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.notes.label" default="Notes" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "notes")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.currentTemple.label" default="Current Temple" /></td>
                            
                            <td valign="top" class="value"><g:link controller="temple" action="show" id="${taoMemberInstance?.currentTemple?.id}">${taoMemberInstance?.currentTemple?.encodeAsHTML()}</g:link></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.taoReceivingTemple.label" default="Tao Receiving Temple" /></td>
                            
                            <td valign="top" class="value"><g:link controller="temple" action="show" id="${taoMemberInstance?.taoReceivingTemple?.id}">${taoMemberInstance?.taoReceivingTemple?.encodeAsHTML()}</g:link></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.vegetarianDate.label" default="Vegetarian Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taoMemberInstance?.vegetarianDate}" /></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.taoReceivingDate.label" default="Tao Receiving Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taoMemberInstance?.taoReceivingDate}" /></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.completedTaoSeminar.label" default="Completed Tao Seminar" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${taoMemberInstance?.completedTaoSeminar}" /></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.introducer.label" default="Introducer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${taoMemberInstance?.introducer?.id}">${taoMemberInstance?.introducer?.encodeAsHTML()}</g:link></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.guarantor.label" default="Guarantor" /></td>
                            
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${taoMemberInstance?.guarantor?.id}">${taoMemberInstance?.guarantor?.encodeAsHTML()}</g:link></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.transmittingMaster.label" default="Transmitting Master" /></td>
                            
                            <td valign="top" class="value"><g:link controller="taoMember" action="show" id="${taoMemberInstance?.transmittingMaster?.id}">${taoMemberInstance?.transmittingMaster?.encodeAsHTML()}</g:link></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.educationLevel.label" default="Education Level" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "educationLevel")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.occupation.label" default="Occupation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "occupation")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.meritFee.label" default="Merit Fee" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "meritFee")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.taoReceivingLunarDate.label" default="Tao Receiving Lunar Date" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "taoReceivingLunarDate")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.taoHelperPositionDate.label" default="Tao Helper Position Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taoMemberInstance?.taoHelperPositionDate}" /></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.taoLecturerPositionDate.label" default="Tao Lecturer Position Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taoMemberInstance?.taoLecturerPositionDate}" /></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.templeHostPositionDate.label" default="Temple Host Position Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taoMemberInstance?.templeHostPositionDate}" /></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.transmittingMasterPositionDate.label" default="Transmitting Master Position Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${taoMemberInstance?.transmittingMasterPositionDate}" /></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.contactRecords.label" default="Contact Records" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${taoMemberInstance.contactRecords}" var="c">
                                    <li><g:link controller="contactRecord" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.languages.label" default="Languages" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "languages")}</td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.permissions.label" default="Permissions" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: taoMemberInstance, field: "permissions")}</td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.roles.label" default="Roles" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${taoMemberInstance.roles}" var="r">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.taoHelperStatus.label" default="Tao Helper Status" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${taoMemberInstance?.taoHelperStatus}" /></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.taoLecturerStatus.label" default="Tao Lecturer Status" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${taoMemberInstance?.taoLecturerStatus}" /></td>
                            
						
                        </tr>
						
                    

						
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="taoMember.templeHostStatus.label" default="Temple Host Status" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${taoMemberInstance?.templeHostStatus}" /></td>
                            
						
                    

						
                            <td valign="top" class="name"><g:message code="taoMember.transmittingMasterStatus.label" default="Transmitting Master Status" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${taoMemberInstance?.transmittingMasterStatus}" /></td>
                            
						
                        </tr>
						
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${taoMemberInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
