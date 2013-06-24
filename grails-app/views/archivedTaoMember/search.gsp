<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'taoMember.label', default: 'TaoMember')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>
  <body>
        <div class="nav">
            <span class="menuButton"><b>Search Results</b></span>
        </div>
	    <div class="body">
	      <g:if test="${flash.message}">
		      <div class="message">${flash.message}</div>
	      </g:if>
	      <div class="list">
				<table>
					<tbody>
					<g:each in="${searchResults}" status="i" var="entry">
	                	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td>
							<g:link action="show" id="${entry.id}">${entry.toString()}</g:link>
						</td>
	                    <td>${entry.email}</td>
						
				        </g:each>
	              </tbody>
	          </table>
	      </div>
	    <div class="paginateButtons">
	      <g:paginate total="${resultCount}" params="${flash}"/>
	    </div>
	  </div>

    
  </body>
</html>
