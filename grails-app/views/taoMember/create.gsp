

<%@ page import="com.fycd.contact.TaoMember" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoMember.label', default: 'TaoMember')}" />
        <g:set var="nullSelect" value="${message(code: 'default.select.null.label', default: 'Please Choose...')}" />
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
            <g:hasErrors bean="${taoMemberInstance}">
            <div class="errors">
                <g:renderErrors bean="${taoMemberInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                    <label for="chineseName"><g:message code="taoMember.chineseName.label" default="Chinese Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'chineseName', 'errors')}">
                                    <g:textField name="chineseName" value="${taoMemberInstance?.chineseName}" />
                                </td>
							
                                <td valign="top" class="name">
                                    <label for="englishName"><g:message code="taoMember.englishName.label" default="English Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'englishName', 'errors')}">
                                    <g:textField name="englishName" value="${taoMemberInstance?.englishName}" />
                                </td>
							
                            </tr>
							
                        
							
                            <tr class="prop">
							
                        
							
                                <td valign="top" class="name">
                                    <label for="gender"><g:message code="taoMember.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'gender', 'errors')}">
                                    <g:select name="gender" from="${['man', 'woman', 'boy', 'girl']}" valueMessagePrefix="taoMember.gender" value="${taoMemberInstance?.gender?.encodeAsHTML()}" noSelection="['null': nullSelect]"/>
                                </td>

                                <td valign="top" class="name">
                                    <label for="currentTemple"><g:message code="taoMember.currentTemple.label" default="Current Temple" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'currentTemple', 'errors')}">
                                    <g:select name="currentTemple.id" from="${com.fycd.contact.Temple.list()}" optionKey="id" value="${taoMemberInstance?.currentTemple?.id}" noSelection="['null': '']" />
                                </td>
							
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                    <label for="phoneNumber"><g:message code="taoMember.phoneNumber.label" default="Phone Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'phoneNumber', 'errors')}">
                                    <g:textField name="phoneNumber" value="${taoMemberInstance?.phoneNumber}" />
                                </td>
							
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="taoMember.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${taoMemberInstance?.email}" />
                                </td>
							
                            </tr>
							
                            <tr class="prop">
                                <td valign="top" class="name">
									<label for="address.street1"><g:message code="taoMember.address.street1.label" default="Street 1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.street1', 'errors')}">
                                    <g:textField name="address.street1" value="${taoMemberInstance?.address?.street1}" />
                                </td>
							
                                <td valign="top" class="name">
									<label for="address.street2"><g:message code="taoMember.address.street2.label" default="Street 2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.street2', 'errors')}">
                                    <g:textField name="address.street2" value="${taoMemberInstance?.address?.street2}" />
                                </td>
                            </tr>
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address.city"><g:message code="taoMember.address.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.city', 'errors')}">
                                    <g:textField name="address.city" value="${taoMemberInstance?.address?.city}" />
                                </td>

                                <td valign="top" class="name">
                                  <label for="address.stateOrProvince"><g:message code="taoMember.address.stateOrProvince.label" default="State/Province" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.stateOrProvince', 'errors')}">
                                    <g:textField name="address.stateOrProvince" value="${taoMemberInstance?.address?.stateOrProvince}" />
                                </td>
                            </tr>                        
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address.zipCode"><g:message code="taoMember.address.zipCode.label" default="Zip Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.zipCode', 'errors')}">
                                    <g:textField name="address.zipCode" value="${taoMemberInstance?.address?.zipCode}" />
                                </td>

                                <td valign="top" class="name">
                                  <label for="address.country"><g:message code="taoMember.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'address.country', 'errors')}">
                                    <g:textField name="address.country" value="${taoMemberInstance?.address?.country}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactPerson"><g:message code="taoMember.contactPerson.label" default="Contact Person" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'contactPerson', 'errors')}">
                                    <gui:autoComplete id="contactPerson" controller="taoMember" action="autoCompleteTaoMember" value="${taoMemberInstance?.contactPerson?.toString()}" />
                                </td>

                                <td valign="top" class="name">
                                  <label for="contactGroup"><g:message code="contactGroup.label" default="Contact Group" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'contactGroup', 'errors')}">
                                    <g:select name="contactGroup.id" from="${com.fycd.contact.ContactGroup.list()}" optionKey="id" value="${taoMemberInstance?.contactGroup?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
							
                            <tr class="prop yui-skin-sam">
							
                                <td valign="top" class="name">
                                  <label for="introducer"><g:message code="taoMember.introducer.label" default="Introducer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'introducer', 'errors')}">
									<gui:autoComplete id="introducer" controller="taoMember" action="autoCompleteTaoMember"/>                                  
	                            </td>
							
                                <td valign="top" class="name">
                                  <label for="guarantor"><g:message code="taoMember.guarantor.label" default="Guarantor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'guarantor', 'errors')}">
									<gui:autoComplete id="guarantor" controller="taoMember" action="autoCompleteTaoMember"/>                                  
                                </td>
							
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birthDate"><g:message code="taoMember.birthDate.label" default="Birth Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'birthDate', 'errors')}">
                                	<g:datePicker name="birthDate" precision="day" value="${taoMemberInstance?.birthDate}" default="none" noSelection="['': '']" />
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="educationLevel"><g:message code="taoMember.educationLevel.label" default="Education Level" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'educationLevel', 'errors')}">
                                    <g:select name="educationLevel" from="${educationLevels}" value="${taoMemberInstance?.educationLevel}" noSelection="['null': nullSelect]"/>
                                </td>
							
                            </tr>
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="notes"><g:message code="taoMember.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'notes', 'errors')}">
                                    <g:textArea name="notes" rows="2" cols="40" value="${taoMemberInstance?.notes}"/><br/>
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="occupation"><g:message code="taoMember.occupation.label" default="Occupation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'occupation', 'errors')}">
                                    <g:textField name="occupation" value="${taoMemberInstance?.occupation}" />
                                </td>
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingDate"><g:message code="taoMember.taoReceivingDate.label" default="Tao Receiving Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingDate', 'errors')}">
                                    <g:datePicker name="taoReceivingDate" precision="day" value="${taoMemberInstance?.taoReceivingDate}" default="none" noSelection="['': '']" />
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingLunarDate"><g:message code="taoMember.taoReceivingLunarDate.label" default="Tao Receiving Lunar Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingLunarDate', 'errors')}">
                                    <g:textField name="taoReceivingLunarDate" value="${taoMemberInstance?.taoReceivingLunarDate}" />
                                </td>
							
                            </tr>
							
							
							<tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingTime"><g:message code="taoMember.taoReceivingTime.label" default="Tao Receiving Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingTime', 'errors')}">
                                   	<g:textField name="taoReceivingTime" value="${taoMemberInstance?.taoReceivingTime}" />
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="taoGroup"><g:message code="taoMember.taoGroup.label" default="Tao Group" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoGroup', 'errors')}">
                                   	<g:select name="taoGroup" from="${taoGroupNames}" value="${taoMemberInstance?.taoGroup}" noSelection="['null': nullSelect]"/>
                                </td>
							
                            </tr>
                            
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="taoReceivingTemple"><g:message code="taoMember.taoReceivingTemple.label" default="Tao Receiving Temple" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'taoReceivingTemple', 'errors')}">
                                    <g:select name="taoReceivingTemple.id" from="${com.fycd.contact.Temple.list()}" optionKey="id" value="${taoMemberInstance?.taoReceivingTemple?.id}" noSelection="['null': '']" />
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="transmittingMaster"><g:message code="taoMember.transmittingMaster.label" default="Transmitting Master" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'transmittingMaster', 'errors')}">
                                    <gui:autoComplete id="transmittingMaster" controller="taoMember" action="autoCompleteTransmittingMaster"/>
                                </td>
							
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="languages"><g:message code="taoMember.languages.label" default="Languages" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'languages', 'errors')}">
                                    <g:select multiple="multiple" from="${['english', 'mandarin', 'cantonese', 'vietnamese']}" valueMessagePrefix="taoMember.languages" name="languages" multiple/>
                                </td>
							
                                <td valign="top" class="name">
                                  <label for="meritFee"><g:message code="taoMember.meritFee.label" default="Merit Fee" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'meritFee', 'errors')}">
                                    <g:textField name="meritFee" value="${fieldValue(bean: taoMemberInstance, field: 'meritFee')}" />
                                </td>
							
                            </tr>
							
                        
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="vegetarianDate"><g:message code="taoMember.vegetarianDate.label" default="Vegetarian Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'vegetarianDate', 'errors')}">
                                    <g:datePicker name="vegetarianDate" precision="day" value="${taoMemberInstance?.vegetarianDate}" default="none" noSelection="['': '']" />
                                </td>
                                							
                                <td valign="top" class="name">
                                  <label for="completedTaoSeminar"><g:message code="taoMember.completedTaoSeminar.label" default="Completed Tao Seminar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'completedTaoSeminar', 'errors')}">
                                    <g:checkBox name="completedTaoSeminar" value="${taoMemberInstance?.completedTaoSeminar}" />
                                </td>
							
                            </tr>
							
                            <tr class="prop">
							
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="taoMember.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: taoMemberInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" maxlength="20" value="${taoMemberInstance?.username}" />
                                </td>

                                <td valign="top" class="name">
                                  <label for="password"><g:message code="taoMember.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:passwordField name="password" maxlength="20" value="" />
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
