$(document).on('turbolinks:load', function() {

  function  ReplaceNum(num) {
    num = num.toLocaleString();
    return num;
  }

  $(".sell-form-text_number").on("keyup", function(e) {
    var input = $(this).val();
    var price = Number(input.replace(/[^0-9]/g, ''));
    $(".sell-form-price-fee-num").val('');

    if( price >= 300 && price <= 9999999 ){
      var fee = Math.floor(price / 10);
      var gains = Math.floor(price - fee);
      var fee_num = ReplaceNum(fee)
      $(".sell-form-price-fee-num").text(fee_num);
      var gains_num = ReplaceNum(gains)
      $(".sell-form-price-gains-num").text(gains_num);
      }
    else {
      $(".sell-form-price-fee-num").text('-');
      $(".sell-form-price-gains-num").text('-');
    }
  });
});
