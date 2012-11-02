<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta name="layout" content="main"/>
	<style>
	div.content {
		margin-left: 50px;
	}
	</style>
</head>

<body>

<div class="content">
	<g:render template="/shared/location" model="[location: location]"/>

	<g:form useToken="true" name="note" url="[controller: 'location', action: 'addNote']"
					style="margin-top: 20px;">
		<div class="control-group">
			<div class="controls">
				<g:textArea name="content" rows="1" cols="40"
										style="width: 690px; height: 100px;"/>
				<br/>
				<button type="submit" class="btn btn-primary">Add a note</button>
				<span class="help-inline">
					You can use
					<a href="http://daringfireball.net/projects/markdown/syntax"
						 target="_blank">markdown</a> in notes
				</span>
			</div>
		</div>
	</g:form>
</div>

</body>
</html>
