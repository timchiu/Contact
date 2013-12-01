<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.fycd.contact.TaoMember" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'taoMember.label', default: 'TaoMember')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <export:resource />
    </head>
    <body>
		<shiro:hasAnyRoles name="admin, master, regionLeader">
	        <div class="nav">
	            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
	        </div>
		</shiro:hasAnyRoles>
		
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="chineseName" style="white-space: nowrap" title="${message(code: 'taoMember.chineseName.label', default: 'C.Name')}" />
                            <g:sortableColumn property="englishName" style="white-space: nowrap" title="${message(code: 'taoMember.englishName.label', default: 'E.Name')}" />
                            <g:sortableColumn property="gender" style="white-space: nowrap" title="${message(code: 'taoMember.gender.label', default: 'Gender')}" />
                            <g:sortableColumn property="age" style="white-space: nowrap" title="${message(code: 'taoMember.age.label', default: 'Age')}" />
                            <shiro:hasAnyRoles name="academicLeader">
	                        	<g:sortableColumn property="grade" title="${message(code: 'taoMember.grade.label', default: 'Grade')}" />
                            </shiro:hasAnyRoles>
                            <g:sortableColumn property="phoneNumber" title="${message(code: 'taoMember.phoneNumber.label', default: 'Telephone')}" />
                            <th style="white-space: nowrap" ><g:message code="taoMember.languages.label" default="Languages" /></th>
                        	<g:sortableColumn property="contactPerson" title="${message(code: 'taoMember.contactPerson.label', default: 'Contact Person')}" />
                        	<g:sortableColumn property="introducer" title="${message(code: 'taoMember.introducer.label', default: 'Introducer')}" />
                        	<g:sortableColumn property="guarantor" title="${message(code: 'taoMember.guarantor.label', default: 'Guarantor')}" />
                        	<g:sortableColumn property="taoReceivingDate" title="${message(code: 'taoMember.taoReceivingDate.label', default: 'Tao Receiving Date')}" />
                        	<g:sortableColumn property="completedTaoSeminar" style="white-space: nowrap" title="${message(code: 'taoMember.completedTaoSeminar.label', default: 'Completed Tao Seminar')}" />
                        	<g:sortableColumn property="contactRecords.dateCreated" style="white-space: nowrap" title="${message(code: 'taoMember.contactRecords.dateCreated.label', default: 'Last Contacted Date')}" />
                        	<g:sortableColumn property="contactRecords.createdBy" style="white-space: nowrap" title="${message(code: 'taoMember.contactRecords.createdBy.label', default: 'Last Contacted By')}" />
							<g:sortableColumn property="contactRecords.description" title="${message(code: 'taoMember.contactRecords.description.label', default: 'Last Contact Details')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taoMemberInstanceList}" status="i" var="taoMemberInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td style="white-space: nowrap"> <g:link action="show" id="${taoMemberInstance.id}">${fieldValue(bean: taoMemberInstance, field: "chineseName")}</g:link></td>
                            <td><g:link action="show" id="${taoMemberInstance.id}">${fieldValue(bean: taoMemberInstance, field: "englishName")}</g:link></td>
                            <td>
                            	<g:if test="${taoMemberInstance?.gender == 'man'}">乾</g:if>
                            	<g:if test="${taoMemberInstance?.gender == 'woman'}">坤</g:if>
                            	<g:if test="${taoMemberInstance?.gender == 'moy'}">童</g:if>
                            	<g:if test="${taoMemberInstance?.gender == 'girl'}">女</g:if>
                            	
                            </td>
                            <td>${fieldValue(bean: taoMemberInstance, field: "age")}</td>
                            
                            <shiro:hasAnyRoles name="academicLeader">
                            	<td>${fieldValue(bean: taoMemberInstance, field: "grade")}</td>
                            </shiro:hasAnyRoles>
                            
                            <td>${fieldValue(bean: taoMemberInstance, field: "phoneNumber")}</td>
                            <td>
	                                <g:each in="${taoMemberInstance?.languages?}" var="l">
	                                    <g:if test="${'mandarin' == l}">國</g:if>
	                                    <g:if test="${'Mandarin' == l}">國</g:if>
	                                    <g:if test="${'english' == l}">英</g:if>
	                                    <g:if test="${'English' == l}">英</g:if>
	                                    <g:if test="${'cantonese' == l}">粵</g:if>
	                                    <g:if test="${'Cantonese' == l}">粵</g:if>
	                                    <g:if test="${'vietnamese' == l}">越南</g:if>
	                                    <g:if test="${'Vietnamese' == l}">越南</g:if>
										<g:if test="${'japanese' == l}">日</g:if>
	                                    <g:if test="${'other' == l}">其他</g:if><%--
	                                    ${l?.encodeAsHTML()}<br>
	                                --%></g:each>
                            </td>
                            <td style="white-space: nowrap" >${fieldValue(bean: taoMemberInstance, field: "contactPerson")}</td>
                            <td style="white-space: nowrap" >${fieldValue(bean: taoMemberInstance, field: "introducer")}</td>
                            <td style="white-space: nowrap" >${fieldValue(bean: taoMemberInstance, field: "guarantor")}</td>
                            <td><g:formatDate format="yyyy-MM-dd" date="${taoMemberInstance?.taoReceivingDate}"/></td>
                            <td><g:checkBox name="completedTaoSeminar" value="${taoMemberInstance.completedTaoSeminar}" /></td>
                            
                            <!-- td><g:link action="show" id="${taoMemberInstance.id}">${fieldValue(bean: taoMemberInstance, field: "contactGroup")}</g:link></td -->
                            <g:if test="${taoMemberInstance?.contactRecords?.size() == 0}">
                            	<td></td>
                            	<td></td>
                            	<td></td>
                            </g:if>	
                            <g:else>
								<td><g:formatDate format="yyyy-MM-dd" date="${taoMemberInstance?.contactRecords?.last()?.dateCreated}"/></td>
								<td><nobr>${taoMemberInstance?.contactRecords?.last()?.createdBy}</nobr></td>
								<td>${taoMemberInstance?.contactRecords?.last()?.description}</td>
                            </g:else>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${taoMemberInstanceTotal}" />
            </div><%--
            <export:formats formats="['csv', 'excel', 'pdf', 'rtf', 'xml']" />
        --%></div>
    </body>
</html>
