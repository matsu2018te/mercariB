$(document).on('turbolinks:load', function() {
// 金額算出
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
      $(".sell-form-price-fee-num").text('¥ ' + fee_num);
      var gains_num = ReplaceNum(gains)
      $(".sell-form-price-gains-num").text('¥ ' + gains_num);
      }
    else {
      $(".sell-form-price-fee-num").text('-');
      $(".sell-form-price-gains-num").text('-');
    }
  });

// ブランド名検索
  var brand_list = $('.brand-search-result')

  function appendBrand(brand) {
    var html = `<a src= "">
                  <li class="sell-contents-brand">${ brand.name }</li>
                </a>`
    brand_list.append(html);
  }

  $(".input_brand").on("keyup", function(e) {
    var input = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/brand/index',
      data: { keyword: input},
      dataType: 'json'
    })
    .done(function(brands) {
      $(".brand-search-result").empty();
      if (brands.length !== 0 && input.length !== 0 ){
        brands.forEach(function(brand) {
          appendBrand(brand);
        });
      }
    })
    .fail(function() {
      alert("ブランドの検索に失敗しました")
    })
  });

  $(document).on("click",".sell-contents-brand",function(e) {
    var brand_name = $(this).html();
    $(".input_brand").val(brand_name);
    $(brand_list).empty();
  });
});
