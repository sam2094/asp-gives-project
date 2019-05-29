(function ($) {
	// Navigation
	
	$(".menu li").hover(function () {
		$(this).find(".submenu").stop(true, true).delay(1).slideDown(170);
	}, function () {
		$(this).find(".submenu").stop(true, true).delay(200).slideUp(170);
	});
	

	// Search div    
	$("#search-toggle").on("click", function () {
		$("#search").slideDown(170);
	});
	$("#search-close").on("click", function () {
		$("#search").slideUp(170);
	});

	$('#mobile-nav').meanmenu();

	//  Slider Home Page
	$(".slider-active").owlCarousel({
		items: 1,
		responsiveClass: true,
		dots: true,
		responsive: {
			0: {
				items: 1
			},
			450: {
				items: 1,
			},
			660: {
				items: 1,
			},
			990: {
				item: 1,
			},
		}
	});

	//    Slider Partners
	if ($("#slider-partner").length > 0) {
		$("#slider-partner").owlCarousel({
			items: 4,
			responsiveClass: true,
			autoPlay: true,
			dots: false,
			responsive: {
				0: {
					items: 1
				},
				450: {
					items: 2,
				},
				660: {
					items: 3,
				},
				990: {
					item: 4,
				},
			}
		});
	};

	// Slider Blog
	if ($("#post-slider").length > 0) {
		$("#post-slider").owlCarousel({
			items: 1,
			nav: true,
			navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
			autoPlay: true,
			dots: true,
		});
	};
	
	//    Progress Bar
	$('.progress-bar > span').each(function () {
		var $this = $(this);
		var width = $(this).data('percent');
		$this.css({
			'transition': 'width 3s'
		});
		setTimeout(function () {
			$this.appear(function () {
				$this.css('width', width + '%');
			});
		}, 500);
	});


	//   Scroll Button 
	$(window).scroll(function () {
		if ($(this).scrollTop() > 400) {
			$('#scroller').fadeIn();
		} else {
			$('#scroller').fadeOut();
		}
	});
	$('#scroller').click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 1500);
		return false;
	});
	
})(jQuery);	
