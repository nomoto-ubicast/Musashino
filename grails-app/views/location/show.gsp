<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta name="layout" content="main"/>
	<style>
	div.content {
		margin-left: 50px;
	}

	div.note-content {
		width: 685px;
	}

	span.last-updated {
		position: absolute;
		right: 5px;
		bottom: 5px;
		color: gray;
		font-size: smaller;
	}
	</style>
</head>

<body>

<div class="content">
	<g:render template="/shared/location" model="[location: location]"/>

	<g:form useToken="true" name="note" url="[controller: 'location', action: 'addNote']"
					style="margin-top: 20px;">
		<g:hiddenField name="location.id" value="${location.id}"/>
		<div class="control-group ${hasErrors(bean: note, field: 'content', 'error')}">
			<div class="controls">
				<g:textArea name="content" rows="1" cols="40"
										style="width: 690px; height: 100px;"/>
				<g:hasErrors bean="${note}" field="content">
					<span class="help-block">
						<g:eachError bean="${note}" field="content">
							<g:message error="${it}"/><br/>
						</g:eachError>
					</span>
				</g:hasErrors>
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

	<div class="notes">
		<g:each in="${location.notes}" var="note">
			<div class="note-content well well-small" style="position: relative;">
				${note.markdownToHtml()}
				<span class="last-updated">
					${note.lastUpdated.format("yyyy-MM-dd HH:mm:ss")}
				</span>
			</div>
		</g:each>
	</div>
</div>

</body>
</html>
