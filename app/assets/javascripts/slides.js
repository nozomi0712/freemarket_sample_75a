$(document).ready(function(){
  $('.slides').slick({
    arrows: true,
    dots: true,
    dotsClass: 'slides-dots',
    prevArrow: '<div class="slider-arrow slider-prev fa fa-angle-left"></div>',
    nextArrow: '<div class="slider-arrow slider-next fa fa-angle-right"></div>',
    cssEase: 'ease-in',
    fade: true,
  });
});
