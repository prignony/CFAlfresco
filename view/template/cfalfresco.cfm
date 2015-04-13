<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link href="http://127.0.0.1:8500/cfalfresco/view/ressources/css/cfalfresco.css" rel="stylesheet" type="text/css" />
		<title>CFAlfresco</title>
	</head>
	<body>
		<div name="container" id="container">
			<table name="tContainer" id="tContainer" align=center cellpadding=0 cellspacing=0>
				<tr name="header" id="header" height="100px">
					<td><cfinclude template="../header/header.cfm"/></td>
				</tr>
				<tr name="menu" id="menu" height="10px">
					<td><cfinclude template="../menu/menu.cfm"/></td>
				</tr>
				<tr name="breadcrumbs" id="breadcrumbs" height="10px">
					<td><cfinclude template="../breadcrumbs/#pageType#_breadcrumbs.cfm"/></td>
				</tr>
				<tr name="content" id="content">
					<td><cfinclude template="../content/#pageType#_content.cfm"/></td>
				</tr>
				<tr name="footer" id="footer" height="25px">
					<td><cfinclude template="../footer/footer.cfm"/></td>
				</tr>
			</table>
		</div>
	</body>
</html>