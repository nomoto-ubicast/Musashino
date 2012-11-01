<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta name="layout" content="main"/>
	<style>
	</style>
</head>
<body>

<p>
<g:form useToken="true" name="location" url="[controller:'hello', action:'create']" class="form-horizontal">
	<g:render template="/shared/textField"
		model="[model: location, name: 'name', id: 'inputName', label: 'Name of Location']" />
	<g:render template="/shared/textField"
		model="[model: location, name: 'address', id: 'inputAddress', label: 'Address', size: 'xxlarge']" />
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn btn-primary">Register this location</button>
		</div>
	</div>
</g:form>
</p>

</body>
</html>
