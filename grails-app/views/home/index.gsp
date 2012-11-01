<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta name="layout" content="main"/>
	<style>
		div.locations {
			margin-left: 50px;
		}
		div.locations div.location {
			margin-top: 20px;
		}
		div.locations div.location-name {
			font-weight: bold;
			font-size: larger;
			text-decoration: underline;
		}
		div.locations div.location-map {
			margin-top: 10px;
			width: 700px;
			height: 300px;
		}
	</style>
</head>
<body>

<g:if test="${flash.message}">
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">×</button>
	${flash.message}
</div>
</g:if>

<p>
<g:form useToken="true" name="location" url="[controller:'home', action:'create']" class="form-horizontal">
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

<script type="text/javascript">
//<![CDATA[
	jQuery(function() {
		jQuery("div.location-map").each(function() {
			var latitude = jQuery(this).children("span.latitude").text();
			var longitude = jQuery(this).children("span.longitude").text();
			musashino.createGoogleMap(this, latitude, longitude);
		});
	});
//]]>
</script>
<div class="locations">
<g:each in="${locations}" var="location">
	<div class="location">
		<div class="location-name">${location.name}</div>
		<div class="location-address">${location.address}</div>
		<div class="location-map">
			<span class="latitude" style="display: none;">${location.latitude}</span>
			<span class="longitude" style="display: none;">${location.longitude}</span>
		</div>
	</div>
</g:each>
</div>

</body>
</html>
