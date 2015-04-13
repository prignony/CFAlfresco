<cfif isDefined("url.reset")>
	<cfset application.cfcs.login = createObject("component", "model.alfresco").init("http://127.0.0.1:8080/alfresco")/>
</cfif>

<cftry>
	<cfset pageType = application.page[url.page]/>	
	<cfcatch>
		<cfset pageType = "home"/>
	</cfcatch>
</cftry>

<cftry>
	<cfif !application.cfcs.login.validateTicket(session.alf_ticket)>
		<cfset application.cfcs.login.logout(session.alf_ticket)/>
		<cfset session.alf_ticket = ""/>
	</cfif>
	<cfcatch>
		<cfset session.alf_ticket = ""/>
	</cfcatch>
</cftry>

<cftry>
	<cfif pageType eq "login" and isDefined("form.loginType")>
		<cfif form.loginType eq 1>
			<cfset session.alf_ticket = application.cfcs.login.login(form.login, form.password)/>
		<cfelse>
			<cfif application.cfcs.login.logout(session.alf_ticket)>
				<cfset session.alf_ticket = ""/>
			</cfif>			
		</cfif>
	</cfif>
	<cfcatch>
		<cfset LOCAL.message = "cfalfresco login/logout failed.">
		<cflog application="false" file="#APPLICATION.logfile#" type="error" text="#LOCAL.message#">
	</cfcatch>
</cftry>

<cfinclude template="../view/template/cfalfresco.cfm"/>
