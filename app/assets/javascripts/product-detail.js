$(function(){

  $('.slider').slick({
    arrows:false,
    asNavFor:'.thumb',
    // initialSlide: 0,
    slidesToShow: 0,
    slidesToScroll: 1,
  });
  $('.thumb').slick({
    asNavFor:'.slider',
    focusOnSelect: true,
    slidesToShow:4,
    slidesToScroll:1
  });








  // $('.box-sub').mouseover(function(e) {
  // $('.box-sub').addClass(".active");
  //   })
  // $('.box-sub').mouseout(function(e) {
  // $('.box-sub').removeClass(".active");
  //   })
});
