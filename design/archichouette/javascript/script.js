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
	
});