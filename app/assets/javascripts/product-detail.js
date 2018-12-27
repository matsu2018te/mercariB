$(function(){

  var mainSlider = ".slider";
  var thumbnailSlider = ".thumb";
  $('.slider').slick({
    autoplay: false,
    speed: 500,
    arrows: false,
    accessibility: false,
    slidesToShow:1,
  });

  $('.thumb').slick({
    accessibility: false,
    slidesToShow:gon.images,
  });

  $(thumbnailSlider+' .slick-slide').on('mouseover',function(){
    var index = $(this).attr("data-slick-index");
    $(mainSlider).slick('slickGoTo', index);
  });

});
