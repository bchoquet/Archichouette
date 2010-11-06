/**
 * 
 */
jQuery(function(){
	//slideshow avec jQuery Cycle
	jQuery(".slideshow").each(function(){
		var $this = $(this);
		if($this.find(".slideshow-contents").children().length < 2) return;
		$this.append('<a href="#" class="prev-arrow"></a><a href="#" class="next-arrow"></a>');
		$this.find(".slideshow-contents").cycle({
								height: "400px",
								next: ".slideshow .next-arrow",
								prev: ".slideshow .prev-arrow"
							});
	});
	
	
	//chargement de la google map
	if(GBrowserIsCompatible && GBrowserIsCompatible() && window.GMapPOIs){
		var i, j, pois, mapId, map, geocoder;
		for(i in window.GMapPOIs){
			pois = window.GMapPOIs[i];
			mapId = 'map-container-' + i.substr(3);
			map = new GMap2(document.getElementById(mapId));
            geocoder = new GClientGeocoder();
            for(j=0; j < pois.length; j++){
	            geocoder.getLatLng(pois[j], function(point) {
	                if (point) {
	                    map.setCenter(point, 16);
	                    var marker = new GMarker(point);
	                    map.addOverlay(marker);
	                }
	            });
            }
		}
	}
});