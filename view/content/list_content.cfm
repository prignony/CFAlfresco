<cfoutput>
<iframe width="99%" height="600px" frameborder="no" align="center" bordercolor="white" scrolling="auto" src="http://127.0.0.1:8080/alfresco/webdav/Dictionnaire%20de%20donn%C3%A9es/Scripts?ticket=#session.alf_ticket#"></iframe>
</cfoutput>


<!---
GET http://<host>:<port>/alfresco/service/blog/category/{category}

Retrieve meta-data for an item in the repository

GET http://<host>:<port>/alfresco/service/blog/2007/03/04/new-release

Update meta-data for an item in the repository

POST http://<host>:<port>/alfresco/service/blog/2007/03/04/new-release?status=Draft

Delete an item in the repository

DELETE http://<host>:<port>/alfresco/service/blog/2007/03/04/new-release 
--->