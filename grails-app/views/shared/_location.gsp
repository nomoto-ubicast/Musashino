<div class="location">
	<div class="location-name">
		<g:link controller="location" action="show" params="[id: location.id]">${location.name}</g:link>
		<a href="#" onclick="deleteLocation(${location.id}, this);
		return false;">
			<i class="icon-remove" style="margin-left: 5px; vertical-align: baseline;"></i></a>
	</div>

	<div class="location-address">${location.address}</div>

	<div class="location-map">
		<span class="latitude" style="display: none;">${location.latitude}</span>
		<span class="longitude" style="display: none;">${location.longitude}</span>
	</div>
</div>
