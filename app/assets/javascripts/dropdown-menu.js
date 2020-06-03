$(function() {
	$("#dd ul li").hover(function() {
		$(">a",this).addClass("category-active");
	},
	function() {
		$(">a",this).removeClass("category-active");
	});
});