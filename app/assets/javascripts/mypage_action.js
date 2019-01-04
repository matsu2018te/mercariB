$(function() {
  $('.mypage__tabs-top li').click(function() {
    var index = $('.mypage__tabs-top li').index(this);
    $('.mypage__item-list-top li').css('display','none');
    $('.mypage__item-list-top li').eq(index).css('display','block');
    $('.mypage__tabs-top li').removeClass('tab-active');
    $(this).addClass('tab-active')
  });
  $('.mypage__tabs-bottom li').click(function() {
    var index = $('.mypage__tabs-bottom li').index(this);
    $('.mypage__item-list-bottom li').css('display','none');
    $('.mypage__item-list-bottom li').eq(index).css('display','block');
    $('.mypage__tabs-bottom li').removeClass('tab-active');
    $(this).addClass('tab-active')
  });
});
