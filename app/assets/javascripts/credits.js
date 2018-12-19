$(function(){
  let image = $('.security-code__image');
  $(document).on("click", function(e) {
    if (e.which === 1){
      if ( image.hasClass("security-code__image--show") === false ){
        if ( $(e.target).hasClass('security-code__description')){
          image.attr('class','security-code__image security-code__image--show');
        }
      } else {
        image.attr('class','security-code__image');
      }
    }
  });
});
