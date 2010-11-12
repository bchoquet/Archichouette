/**
 * 
 */
jQuery(function(){
	if(Modernizr.textshadow){
		jQuery("header nav a").archiTitre();
		jQuery(".block .title").archiTitre();
		jQuery(".pastille .title").archiTitre();
	}
	
	//slideshow avec jQuery Cycle
	jQuery(".class-jeu .slideshow, .class-event .slideshow").archiCycle({height: 400});
	jQuery(".block-gallery1 .slideshow").archiCycle({height: 325});
	jQuery(".block-gallery2 .slideshow").archiCycle({height: 261});
	jQuery(".block-itemlist1 .slideshow").archiCycle({height: 200});
	
	
	//liens externes
	jQuery("a[rel='external']").click(function(){
		window.open(this.href, '_blank');
		return false;
	});
	
	//chargement de la google map
	if(window.GBrowserIsCompatible != undefined && GBrowserIsCompatible() && window.GMapPOIs){
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