(function($, undefined){
	
	$.fn.archiCycle = function(opts){
		opts = opts || {};
		var config = $.extend({width: 400}, opts);

		this.each(function(){
			var $this = $(this);
			if($this.find(".slideshow-contents").children().length < 2) return;
			$this.addClass('cycle').append('<a href="#" class="prev-arrow"></a><a href="#" class="next-arrow"></a>');
			$this.find(".slideshow-contents").cycle({
									//height: config.height+"px",
									next: ".slideshow .next-arrow",
									prev: ".slideshow .prev-arrow"
								});
		});
		
	}
	
	
})(jQuery);