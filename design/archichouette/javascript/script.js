/**
 * 
 */
jQuery(function(){
	//slideshow avec jQuery Cycle
	jQuery(".slideshow").append('<a href="#" class="prev-arrow"></a><a href="#" class="next-arrow"></a>');
	jQuery(".slideshow-contents").cycle({
							height: "400px",
							next: ".slideshow .next-arrow",
							prev: ".slideshow .prev-arrow"
						});
});