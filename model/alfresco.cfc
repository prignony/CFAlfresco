<cfcomponent displayname="alfresco" hint="I'm the alfresco proxy" output="false">
	<cfproperty name="alfrescoRoot" displayname="alfrescoRoot" hint="I'm the root to the alfresco service interface" type="string" default="" />
	
	<cffunction name="init" displayname="init" description="I initialise the object" hint="I initialise the object" access="public" output="false" returntype="alfresco">
		<cfargument name="alfrescoRoot" type="string">		
		
		<cfset variables.alfrescoRoot = arguments.alfrescoRoot/>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="logout" displayname="logout" description="I log the user off alfresco" hint="I log the user off alfresco" access="public" output="false" returntype="boolean">
		<cfargument name="alf_ticket" type="string">		
		<cfset var LOCAL = {}/>
		<cfset LOCAL.success = false/>		
		<cftry>
			<cfhttp url="#variables.alfrescoRoot#/service/api/login/ticket/#arguments.alf_ticket#?alf_ticket=#arguments.alf_ticket#" method="delete"/>
			<cfset LOCAL.success = cfhttp.ResponseHeader.status_code eq 200/>	 
			<cfcatch type="any">
				<cfset LOCAL.message = "components.alfresco.logout() failed.">
				<cflog application="false" file="#APPLICATION.logfile#" type="error" text="#LOCAL.message#">
			</cfcatch>
		</cftry>		
		<cfreturn LOCAL.success/>
	</cffunction>

	<cffunction name="login" displayname="login" description="I log the user on alfresco" hint="I log the user on alfresco" access="public" output="false" returntype="string">
		<cfargument name="username" type="string">
		<cfargument name="password" type="string">		
		<cfset var LOCAL = {}/>
		<cfset LOCAL.alf_ticket = ""/>		
		<cftry>
			<cfhttp url="#variables.alfrescoRoot#/service/api/login?u=#arguments.username#&pw=#arguments.password#" method="get"/>
			<cfset LOCAL.xmlTicketResponse = XmlParse(Trim(cfhttp.FileContent))/>
			<cfset LOCAL.alf_ticket = LOCAL.xmlTicketResponse.ticket.xmlText/>			
			<cfcatch type="any">
				<cfset LOCAL.message = "components.alfresco.login() failed.">
				<cflog application="false" file="#APPLICATION.logfile#" type="error" text="#LOCAL.message#">
			</cfcatch>
		</cftry>		
		<cfreturn LOCAL.alf_ticket/>
	</cffunction>

	<cffunction name="validateTicket" displayname="validateTicket" description="I validate a ticket from alfresco" hint="I validate a ticket from alfresco" access="public" output="false" returntype="boolean">
		<cfargument name="alf_ticket" type="string">
		<cfset var LOCAL = {}/>
		<cfset LOCAL.success = false/>
		<cftry>
			<cfhttp url="#variables.alfrescoRoot#/service/api/login/ticket/#arguments.alf_ticket#?alf_ticket=#arguments.alf_ticket#" method="get"/>
			<cfset LOCAL.success = cfhttp.ResponseHeader.status_code eq 200/>
			<cfcatch type="any">
				<cfset LOCAL.message = "components.alfresco.validateTicket() failed.">
				<cflog application="false" file="#APPLICATION.logfile#" type="error" text="#LOCAL.message#">
			</cfcatch>
		</cftry>
		<cfreturn LOCAL.success/>
	</cffunction>
	
	<cffunction name="documentList" displayname="documentList" description="I get the document List from alfresco" access="public" output="false" returntype="any">
		<cfargument name="alf_ticket" type="string">
		<cfargument name="format" type="string" default="">
		<cfargument name="filter" type="string" default="">
		<cfargument name="path" type="string" default="">
		<cfargument name="query" type="string" default="">
		
		<cfset var LOCAL = {}/>
		<cfset LOCAL.answer = ""/>
		<cftry>
			<cfhttp url="#variables.alfrescoRoot#/service/ui/doclist?alf_ticket=#arguments.alf_ticket##format##filter##path##query#" method="get"/>
			<cfset LOCAL.answer = cfhttp.filecontent/>
			<cfcatch type="any">
				<cfset LOCAL.message = "components.alfresco.documentListPanel() failed.">
				<cflog application="false" file="#APPLICATION.logfile#" type="error" text="#LOCAL.message#">
			</cfcatch>
		</cftry>
		<cfreturn LOCAL.answer/>
	</cffunction>
	
	<cffunction name="documentListPanel" displayname="documentListPanel" description="I get the document List Panel from alfresco" access="public" output="false" returntype="any">
		<cfargument name="alf_ticket" type="string">
		<cfargument name="format" type="string" default="">
		<cfargument name="filter" type="string" default="">
		<cfargument name="path" type="string" default="">
		<cfargument name="home" type="string" default="">
		<cfargument name="query" type="string" default="">
		
		<cfset var LOCAL = {}/>
		<cfset LOCAL.answer = ""/>
		<cftry>
			<cfhttp url="#variables.alfrescoRoot#/service/ui/doclistpanel?alf_ticket=#arguments.alf_ticket##format##filter##path##home##query#" method="get"/>
			<cfset LOCAL.answer = cfhttp.filecontent/>
			<cfcatch type="any">
				<cfset LOCAL.message = "components.alfresco.documentListPanel() failed.">
				<cflog application="false" file="#APPLICATION.logfile#" type="error" text="#LOCAL.message#">
			</cfcatch>
		</cftry>
		<cfreturn LOCAL.answer/>
	</cffunction>

</cfcomponent>