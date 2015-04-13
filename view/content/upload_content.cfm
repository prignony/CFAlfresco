<cfif isDefined("form.file")>
	<cftry>
		<cfhttp url="http://localhost:8080/alfresco/upload/workspace/SpacesStore/09efa1a2-6ae2-4b8e-94bd-be2a33978f31/#form.fileName#?ticket=#session.alf_ticket#" method="put">
		   <cfhttpparam type="file" name="myFile" file="#form.file#" >
		</cfhttp>
		<cfoutput>Upload Ok for file #form.fileName#<br/></cfoutput>
		<!--- <cfdump var="#cfhttp#"> --->
		<cfcatch>
			<cfoutput>Upload Error for file #form.fileName#<br/></cfoutput>
		</cfcatch>
	</cftry>
<cfelse>
	<script type="text/javascript">
	function showSrc() {
		document.getElementById("myFileName").value = /([^\\]+)$/.exec(document.getElementById("myFile").value)[1];
		document.getElementById("myTitle").value = document.getElementById("myFileName").value;
	}
	</script>
	<!--- CMIS - UploadContentServlet--->
	<form action="index.cfm?page=4" method="post" enctype="multipart/form-data" accept-charset="utf-8">
		<input type="hidden" name="fileName" id="myFileName" value="temp"/>
		<table>
			<tr><td>File:</td><td><input type="file" name="file" id="myFile" onChange="javascript:showSrc();" ></td></tr>
			<tr><td>Title:</td><td><input name="title" id="myTitle"></td></tr>
			<tr><td>Description:</td><td><input name="desc"></td></tr>
			<tr><td colspan=2><input type="submit" name="submit" value="Upload"></td></tr>
		</table>
	</form>
</cfif>