<cfset application.alfrescoRoot="http://127.0.0.1:8080/alfresco"/>
<cfset application.alfrescoUsername="admin"/>
<cfset application.alfrescoPassword="admin"/>
<cfset application.logfile="alf_log"/>

<cffunction name="getTicket" returntype="string">
   <cftry>
      <cfhttp url="#APPLICATION.alfrescoRoot#/service/api/login?u=#APPLICATION.alfrescoUsername#&pw=#APPLICATION.alfrescoPassword#" method="GET">
      <cfdump var="#XmlParse(Trim(cfhttp.FileContent))#">
      <cfscript>
         xmlTicketResponse = XmlParse(Trim(cfhttp.FileContent));
         ticket = xmlTicketResponse.ticket.xmlText;
         return ticket;
      </cfscript>
      <cfcatch type="any">
      <cfset message = "components.titlemanager.alfresco.getTicket() failed.">
      <cflog application="false" file="#APPLICATION.logfile#" type="error" text="#message#">
      </cfcatch>
   </cftry>
</cffunction>

<cfdump var="#getTicket()#"/>