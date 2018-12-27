$(function(){
  let modal = $('.modal');
  let btn = $('.calcel-btn');

  btn.on("click", function(){
    modal.addClass('modal__show');
  });

  $('.delete-dialog__select__cancel').on('click', function(){
    modal.removeClass('modal__show');
  })
});
