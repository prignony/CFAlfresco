<cfif not structkeyexists(session, "alf_ticket") or session.alf_ticket eq "">
	<form name="login" id="login" action="index.cfm?page=2" method="post"> 
		<input type="hidden" name="loginType" value="1"/>
		<table>
			<tr>
				<td>Login</td>
				<td>:</td>
				<td><input name="login" type="text"/></td>
			</tr>
			<tr>
				<td>Password</td>
				<td>:</td>
				<td><input name="password" type="password"/></td>
			</tr>
			<tr>
				<td colspan=3><input type="submit" value="login"/></td>
			</tr>
		</table>
	</form>
<cfelse>
	You are logged in.<br/>
	<form name="logout" id="logout" action="index.cfm?page=2" method="post">
		<input type="hidden" name="loginType" value="0"/>
		<input type="submit" name="logout" value="logout"/>
	</form>
</cfif>