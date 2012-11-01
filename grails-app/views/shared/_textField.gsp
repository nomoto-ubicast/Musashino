<div class="control-group ${hasErrors(bean: model, field: name, 'error')}">
	<label class="control-label" for="${id}">${label}</label>
	<div class="controls">
		<g:textField name="${name}" placeholder="${label}" id="${id}"
			class="${size ? "input-" + size : ""}"/>
		<g:hasErrors bean="${model}" field="${name}">
			<span class="help-inline">
				<g:eachError bean="${model}" field="${name}">
					<g:message error="${it}"/><br/>
				</g:eachError>
			</span>
		</g:hasErrors>
	</div>
</div>
