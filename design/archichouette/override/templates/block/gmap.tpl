{def $key = ezini('GoogleMaps', 'Key', 'archichouette.ini')
     $location = $block.custom_attributes.location}


<h1 class="title rounded-trb">{$block.name|wash()}</h1>

<div id="map-container-{$block.id}" class="map-container rounded block-contents-unbordered"></div>

{*
    Do not load GMap API if key is empty.
    Option to skip loading GMap API in case when it was loaded globally e.g in <head> section
*}
{if ne( $key, '' )}
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key={$key}" type="text/javascript"></script>
{/if}
<script type="text/javascript">
window.GMapPOIs = window.GMapPOIs || {ldelim}{rdelim};
window.GMapPOIs.map{$block.id} = [];
window.GMapPOIs.map{$block.id}.push('{$location}');
</script>

{undef $key $location}