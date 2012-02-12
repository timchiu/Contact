<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.fycd.contact.TaoMember" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoMember.label', default: 'TaoMember')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <gui:resources components="['autoComplete']"/>
    </head>
    <body class="yui-skin-sam">
        <div class="nav">
            <!-- span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span -->
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
			<shiro:hasAnyRoles name="admin, master, regionLeader, seniorLecturer">
	            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
	        </shiro:hasAnyRoles>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taoMemberInstance}">
            <div class="errors">
                <g:renderErrors bean="${taoMemberInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${taoMemberInstance?.id}" />
                <g:hiddenField name="version" value="${taoMemberInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="chineseName"><g:message code="taoMember.chineseName.label" default="Chinese Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'chineseName', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
	                                    <g:textField name="chineseName" value="${taoMemberInstance?.chineseName}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "chineseName")}
	                                </shiro:hasAnyRoles>
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="englishName"><g:message code="taoMember.englishName.label" default="English Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'englishName', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
	                                    <g:textField name="englishName" value="${taoMemberInstance?.englishName}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "englishName")}
	                                </shiro:hasAnyRoles>
                                </td>
                            </tr>
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gender"><g:message code="taoMember.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'gender', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
	                                    <g:select name="gender" from="${genderList}" value="${taoMemberInstance?.gender?.encodeAsHTML()}" noSelection="['null': 'Please Choose...']"/>
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "gender")}
	                                </shiro:hasAnyRoles>
                                </td>

                                <td valign="top" class="name">
                                  <label for="currentTemple"><g:message code="taoMember.currentTemple.label" default="Current Temple" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'currentTemple', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
	                                    <g:select name="currentTemple.id" from="${com.fycd.contact.Temple.list()}" optionKey="id" value="${taoMemberInstance?.currentTemple?.id}" noSelection="['null': '']" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "currentTemple")}
	                                </shiro:hasAnyRoles>
                                </td>
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="phoneNumber"><g:message code="taoMember.phoneNumber.label" default="Phone Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'phoneNumber', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="phoneNumber" value="${taoMemberInstance?.phoneNumber}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "phoneNumber")}
	                                </shiro:hasAnyRoles>
                                </td>
							
                        
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="taoMember.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'email', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="email" value="${taoMemberInstance?.email}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "email")}
	                                </shiro:hasAnyRoles>
                                </td>
                            </tr>
							
                        
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address.street1"><g:message code="taoMember.address.street1.label" default="Street 1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.street1', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="address.street1" value="${taoMemberInstance?.address?.street1}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "address.street1")}
	                                </shiro:hasAnyRoles>
                                </td>

                                <td valign="top" class="name">
                                  <label for="address.street2"><g:message code="taoMember.address.street2.label" default="Street 2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.street2', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="address.street2" value="${taoMemberInstance?.address?.street2}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "address.street2")}
	                                </shiro:hasAnyRoles>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address.city"><g:message code="taoMember.address.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.city', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="address.city" value="${taoMemberInstance?.address?.city}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "address.city")}
	                                </shiro:hasAnyRoles>
                                </td>

                                <td valign="top" class="name">
                                  <label for="address.stateOrProvince"><g:message code="taoMember.address.stateOrProvince.label" default="State/Province" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.stateOrProvince', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="address.stateOrProvince" value="${taoMemberInstance?.address?.stateOrProvince}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "address.stateOrProvince")}
	                                </shiro:hasAnyRoles>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address.zipCode"><g:message code="taoMember.address.zipCode.label" default="Zip Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.zipCode', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="address.zipCode" value="${taoMemberInstance?.address?.zipCode}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "address.zipCode")}
	                                </shiro:hasAnyRoles>
                                </td>

                                <td valign="top" class="name">
                                  <label for="address.country"><g:message code="taoMember.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.country', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, groupLeader, regionLeader, academicLeader">
	                                    <g:textField name="address.country" value="${taoMemberInstance?.address?.country}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "address.country")}
	                                </shiro:hasAnyRoles>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactPerson"><g:message code="taoMember.contactPerson.label" default="Contact Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'contactPerson', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
                                		<gui:autoComplete id="contactPerson" controller="taoMember" action="autoCompleteTaoMember" value="${taoMemberInstance?.contactPerson?.toString()}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "contactPerson")}
	                                </shiro:hasAnyRoles>
                                </td>

                                <td valign="top" class="name">
                                  <label for="contactGroup"><g:message code="contactGroup.label" default="Contact Group" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'contactGroup', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
	                                    <g:select name="contactGroup.id" from="${com.fycd.contact.ContactGroup.list()}" optionKey="id" value="${taoMemberInstance?.contactGroup?.id}" noSelection="['null': '']" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "contactGroup")}
	                                </shiro:hasAnyRoles>
                                </td>
                            </tr>
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="introducer"><g:message code="taoMember.introducer.label" default="Introducer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'introducer', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
	                                    <gui:autoComplete id="introducer" controller="taoMember" action="autoCompleteTaoMember" value="${taoMemberInstance?.introducer?.toString()}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "introducer")}
	                                </shiro:hasAnyRoles>                                
	                            </td>
							
                                <td valign="top" class="name">
                                  <label for="guarantor"><g:message code="taoMember.guarantor.label" default="Guarantor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'guarantor', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
										<gui:autoComplete id="guarantor" controller="taoMember" action="autoCompleteTaoMember" value="${taoMemberInstance?.guarantor?.toString()}" />
	                                </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "guarantor")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                            </tr>
                        
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birthDate"><g:message code="taoMember.birthDate.label" default="Birth Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'birthDate', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, academicLeader">
	                                    <g:datePicker name="birthDate" precision="day" value="${taoMemberInstance?.birthDate}" default="none" noSelection="['': '']" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "birthDate")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="educationLevel"><g:message code="taoMember.educationLevel.label" default="Education Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'educationLevel', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, groupLeader, academicLeader">
	                                    <g:select name="educationLevel" from="${educationLevels}" value="${taoMemberInstance?.educationLevel}" noSelection="['null': 'Please Choose...']"/>
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "educationLevel")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                            </tr>
							
                            <shiro:hasAnyRoles name="admin, master, regionLeader, academicLeader">
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="grade"><g:message code="taoMember.grade.label" default="Grade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'grade', 'errors')}">
	                                    <g:select name="grade" from="${grades}" value="${taoMemberInstance?.grade ?: 0}" noSelection="['null': 'Please Choose...']"/>
                                </td>

                                <td valign="top" class="name"/>
                                <td valign="top" class="value"/>
                            </tr>
	                        </shiro:hasAnyRoles>
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="notes"><g:message code="taoMember.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'notes', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, groupLeader, academicLeader">
	                                    <g:textArea name="notes" rows="2" cols="40" value="${taoMemberInstance?.notes}"/><br/>
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "notes")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
							
                                <td valign="top" class="name">
                                  <label for="occupation"><g:message code="taoMember.occupation.label" default="Occupation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'occupation', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, groupLeader, academicLeader">
	                                    <g:textField name="occupation" value="${taoMemberInstance?.occupation}" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "occupation")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                            </tr>
                        
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingDate"><g:message code="taoMember.taoReceivingDate.label" default="Tao Receiving Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingDate', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
	                                    <g:datePicker name="taoReceivingDate" precision="day" value="${taoMemberInstance?.taoReceivingDate}" default="none" noSelection="['': '']" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "taoReceivingDate")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingLunarDate"><g:message code="taoMember.taoReceivingLunarDate.label" default="Tao Receiving Lunar Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingLunarDate', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
	                                    <g:textField name="taoReceivingLunarDate" value="${taoMemberInstance?.taoReceivingLunarDate}" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "taoReceivingLunarDate")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                            </tr>
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingTime"><g:message code="taoMember.taoReceivingTime.label" default="Tao Receiving Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingTime', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
                                    	<g:textField name="taoReceivingTime" value="${taoMemberInstance?.taoReceivingTime}" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "taoReceivingTime")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="taoGroup"><g:message code="taoMember.taoGroup.label" default="Tao Group" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoGroup', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
                                    	<g:select name="taoGroup" from="${taoGroupNames}" value="${taoMemberInstance?.taoGroup}" noSelection="['null': 'Please Choose...']"/>
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "taoGroup")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                            </tr>
                            
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingTemple"><g:message code="taoMember.taoReceivingTemple.label" default="Tao Receiving Temple" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingTemple', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
	                                    <g:select name="taoReceivingTemple.id" from="${com.fycd.contact.Temple.list()}" optionKey="id" value="${taoMemberInstance?.taoReceivingTemple?.id}" noSelection="['null': '']" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "taoReceivingTemple")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="transmittingMaster"><g:message code="taoMember.transmittingMaster.label" default="Transmitting Master" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'transmittingMaster', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
	                                    <gui:autoComplete id="transmittingMaster" controller="taoMember" action="autoCompleteTransmittingMaster" value="${taoMemberInstance?.transmittingMaster?.toString()}"/>
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "transmittingMaster")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                            </tr>
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="languages"><g:message code="taoMember.languages.label" default="Languages" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'languages', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, regionLeader, groupLeader, academicLeader">
	                                    <g:select multiple="multiple" from="${['english', 'mandarin', 'cantonese', 'vietnamese']}" valueMessagePrefix="taoMember.languages" name="languages" multiple/>
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member">
	                                    ${fieldValue(bean: taoMemberInstance, field: "languages")}
	                                </shiro:hasAnyRoles>                                
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="meritFee"><g:message code="taoMember.meritFee.label" default="Merit Fee" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'meritFee', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
	                                    <g:textField name="meritFee" value="${fieldValue(bean: taoMemberInstance, field: 'meritFee')}" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "meritFee")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vegetarianDate"><g:message code="taoMember.vegetarianDate.label" default="Vegetarian Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'vegetarianDate', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer">
	                                    <g:datePicker name="vegetarianDate" precision="day" value="${taoMemberInstance?.vegetarianDate}" default="none" noSelection="['': '']" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "vegetarianDate")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                                							
                                <td valign="top" class="name">
                                  <label for="completedTaoSeminar"><g:message code="taoMember.completedTaoSeminar.label" default="Completed Tao Seminar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'completedTaoSeminar', 'errors')}">
                                	<shiro:hasAnyRoles name="admin, master, seniorLecturer, academicLeader">
	                                    <g:checkBox name="completedTaoSeminar" value="${taoMemberInstance?.completedTaoSeminar}" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "completedTaoSeminar")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                            </tr>

						<shiro:hasAnyRoles name="admin">
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="taoMember.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'username', 'errors')}">
                                	<shiro:hasAnyRoles name="admin">
	                                    <g:textField name="username" maxlength="20" value="${taoMemberInstance?.username}" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, master, seniorLecturer, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "transmittingMasterStatus")}
	                                </shiro:hasAnyRoles>                                
                                </td>

                                <td valign="top" class="name">
                                  <label for="password"><g:message code="taoMember.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value">
                                	<shiro:hasAnyRoles name="admin">
	                                    <g:passwordField name="password" maxlength="20" value="" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, master, seniorLecturer, academicLeader">
	                                    ********
	                                </shiro:hasAnyRoles>                                
                                </td>

                            </tr>

                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="roles"><g:message code="role.label" default="Roles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'roles', 'errors')}">
                                	<shiro:hasAnyRoles name="admin">
	                                    <g:select name="roles" from="${com.fycd.contact.Role.list()}"  optionKey="id" value="${taoMemberInstance?.roles*.id}" noSelection="['null': '']"/>
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, master, seniorLecturer, regionLeader, groupLeader, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "roles")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                                
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="taoMember.excelId.label" default="ExcelId" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'excelId', 'errors')}">
                                	<shiro:hasAnyRoles name="admin">
	                                    <g:textField name="excelId" maxlength="20" value="${taoMemberInstance?.excelId}" />
                                    </shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="member, regionLeader, groupLeader, master, seniorLecturer, academicLeader">
	                                    ${fieldValue(bean: taoMemberInstance, field: "excelId")}
	                                </shiro:hasAnyRoles>                                
                                </td>
                            </tr>
						</shiro:hasAnyRoles>			
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
