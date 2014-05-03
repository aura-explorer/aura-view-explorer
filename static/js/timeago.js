(function($){
	$(function(){
		$.timeago.settings.allowFuture = true;
		$("abbr.timeago").timeago();
	});
})(jQuery);
