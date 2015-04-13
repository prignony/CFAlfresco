<cfcomponent output="no">
	
	<cfscript>
		this.name = "cfalfresco" ;
		this.applicationTimeout = createTimeSpan(10,0,0,0) ;
		this.clientmanagement = "yes" ;
		this.sessionmanagement = "yes";
		this.sessionTimeout = createTimeSpan(0,2,0,0) ;
		this.loginStorage = "Session";		
	</cfscript>
	
	<!--- Runs when Coldfusion Server receives the first request for a page --->
	<cffunction name="onApplicationStart" returntype="boolean">	
        <cflock type="exclusive" scope="application" timeout="5">
			<cfscript>
				application.cfcs.login = createObject("component", "model.alfresco").init("http://127.0.0.1:8080/alfresco");
				application.logfile = "alf_log";   
				application.page = {};
				structinsert(application.page,1,"home");
				structinsert(application.page,2,"login");
				structinsert(application.page,3,"list");
				structinsert(application.page,4,"upload");
				structinsert(application.page,5,"download");           
            </cfscript>
        </cflock>
		<cfreturn true>
	</cffunction>	
	
	<!--- Runs when an application times out or the server is shutting down --->
	<cffunction name="onApplicationEnd" returntype="void" output="false">
		<cfargument name="ApplicationScope" required="yes">
	</cffunction>	
	
	<cffunction name="onRequestStart" output="false" returntype="boolean">	
        <cfargument name="TargetPage" type="string" required="yes">
		<cfreturn true>
	</cffunction>	
	
	<cffunction name="onRequest" returntype="void">
		<cfargument name="TargetPage" type="string" required="yes">
		<cfset css = "" /><cfset header = "" />
		<cfset menu = "" /><cfset breadcrumbs = "" />
		<cfset content = "" /><cfset footer = "" />	
    	<cfinclude template="#Arguments.TargetPage#">
    </cffunction>	
	
	<cffunction name="onRequestEnd" returntype="void" output="false">
		<cfargument name="TargetPage" type="string" required="yes">
	</cffunction>	
	
	<!--- Runs when a session starts --->
	<cffunction name="onSessionStart" returntype="void" output="false">
		<cfparam name="session.alf_ticket" default="">
	</cffunction>	
	
	<!--- Runs when a session ends --->
	<cffunction name="onSessionEnd" output="false" returntype="void">	
	  	<cfargument name="SessionScope" type="struct" required="yes">
		<cfargument name="ApplicationScope" type="struct" required="no">
		
		<cfif isDefined(session.alf_ticket) and session.alf_ticket neq "">
			<cfset application.cfcs.login.logout(session.alf_ticket)/>
		</cfif>
		<cflocation url="index.cfm?page=2" addtoken="No">
	</cffunction>
	
	<!--- Runs when an uncaught exception occurs in the application --->
	<cffunction name="onError" output="true">
        <cfargument name="Exception" required="yes">
		<cfargument name="EventName" type="string" required="yes">
		
		<cflog file="#this.name#" type="error" text="Event Name: #Arguments.EventName#">
		<cflog file="#this.name#" type="error" text="Message: #Arguments.Exception.message#">
	</cffunction>	
	
</cfcomponent>