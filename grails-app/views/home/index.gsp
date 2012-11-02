<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta name="layout" content="main"/>
	<style>
	div.locations {
		margin-top: 30px;
		margin-left: 50px;
	}

	div.locations div.location {
		margin-top: 30px;
	}
	</style>
</head>

<body>

<p>
<g:form useToken="true" name="location" url="[controller: 'home', action: 'create']" class="form-horizontal">
	<g:render template="/shared/textField"
						model="[model: location, name: 'name', id: 'inputName', label: 'Name of Location']"/>
	<g:render template="/shared/textField"
						model="[model: location, name: 'address', id: 'inputAddress', label: 'Address', size: 'xxlarge']"/>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn btn-primary">Register this location</button>
		</div>
	</div>
</g:form>
</p>

<script type="text/javascript">
	//<![CDATA[
	function deleteLocation(id, button) {
		if (!window.confirm("Are you sure you want to delete this location?")) return false;
		jQuery.get("<g:createLink controller="home" action="delete"/>", {id:id});
		var locationDiv = jQuery(button).closest("div.location");
		locationDiv.fadeOut("slow", function () {
			locationDiv.remove();
		});
	}
	//]]>
</script>

<div class="locations">
	<g:each in="${locations}" var="location">
		<g:render template="/shared/location" model="[location: location]"/>
	</g:each>
</div>

</body>
</html>
