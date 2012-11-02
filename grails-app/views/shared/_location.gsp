<div class="location">
	<div class="location-name">
		<g:link controller="location" action="show" params="[id: location.id]">${location.name}</g:link>
		<span class="note-count">(${location.notes.size()} notes)</span>
		<a href="#" onclick="deleteLocation(${location.id}, this);
		return false;">
			<i class="icon-remove"></i></a>
	</div>

	<div class="location-address">${location.address}</div>

	<div class="location-map">
		<span class="latitude" style="display: none;">${location.latitude}</span>
		<span class="longitude" style="display: none;">${location.longitude}</span>
	</div>
</div>
