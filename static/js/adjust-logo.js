(function($){
	$(function(){
		var center_location, logo_width, logo_location;
		center_location = $("img.block-icon").first().offset().left + 10;
		logo_width = $("img.blockchain-logo").width();
		logo_location = $("img.blockchain-logo").offset().left;
		$("img.blockchain-logo").css("margin-left", "-=" + logo_location - (logo_width/2 - center_location));
	});
})(jQuery);
