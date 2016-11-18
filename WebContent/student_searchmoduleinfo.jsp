<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Module Info - STUDENT</title>
</head>
<body>
	<span>Search Modules</span><br/>
	<form action="process_searchmoduleinfo.jsp" method="POST">
		<span>Search for:</span>
		<input type="text" name="searchModuleTerms" required aria-required="true" pattern="[A-Za-z\s]+" title="Make sure that the input does not contain any special characters." /><br/>
		<input type="submit" value="Search" /><br/>
	</form>
	
	<div>
		<%
		// The below blocks of code will display the details of the retrieved module information from the server-processing page
		
		//The isPosted variable checks whether has the form from the following page being POSTED (HTTP POST) to the server for
		//processing/query the module information that matches the search term.
		final boolean isPosted = (null != request.getAttribute("IsPosted")?(boolean) request.getAttribute("IsPosted"): false);
		
		if(isPosted)
		{
			final int[] moduleCode = (int[]) request.getAttribute("moduleCode");
			final String[] moduleName = (String[]) request.getAttribute("moduleName");
			final String[] moduleDesc = (String[]) request.getAttribute("moduleDesc");
			
			if(moduleCode != null)
			{
				System.out.println("LENGTH: " + moduleCode.length);
		%>
				<br/>
				<table border="1">
					<tr>
						<th>Module Code</th>
						<th>Module Name</th>
						<th>Module Description</th>
					</tr>
		<%
				for(int i=0; i<moduleCode.length;i++)
				{
		
		%>
					<tr>
						<td><%=moduleCode[i] %></td>
						<td><%=moduleName[i] %></td>
						<td><%=moduleDesc[i] %></td>
					</tr>
		<%
				}//End For-Loop
		%>
				</table>
		<%
			}
			else
			{
				// Displays the "No results found. Please search again" message when there isn't any module information records 
				// (from the module table) that matches the enetered search terms for query.
		%>
				<h3>No results found. Please search again.</h3>
		<%
			}
		}
		%>
	
	</div>
</body>
</html>