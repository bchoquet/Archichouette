(function($, undefined){
		$.fn.archiTitre = function(){
		
		this.each(function(){
			var $this = $(this);
			setTimeout(function(){
				
				$this.css({
					width: $this.width(),
					height: Math.round($this.height()/3*2)
				});
				$this.addClass("archiTitre");
				$this.contents().wrapAll('<span class="decalage"></span>');
			}, 100);
		});
	}
})(window.jQuery);