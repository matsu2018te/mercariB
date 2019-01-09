$(function(){
  function append_child_option(select, check_boxes, results){
    select.empty()
    check_boxes.empty();
    select.append(`<option value="">---</option>`);
    results.forEach(function(result){
      select.append(`<option value="${result.id}">${result.name}</option>`)
    })
  }

  function append_g_child_check_boxes(check_boxes, results){
    check_boxes.empty();
    results.forEach(function(result){
      check_boxes.append(`<div  class="form__checkbox">\n\t<input type="checkbox" value="${result.id}" name="q[category_id_in][]" id="q_category_id_in_${result.id}">\n\t<label for="q_category_id_in_${result.id}">${result.name}</label>\n</div>`)
    })
  }

  function append_size_check_boxes(check_box, results) {
    check_box.empty();
    results.forEach(function(result){
      check_box.append(`<div class="form__checkbox">\n<input type="checkbox" value="${result.id}" name="q[size_id_in][]" id="q_size_id_in_${result.id}">\n<label for="q_size_id_in_${result.id}">${result.size}</label>\n</div>`)
    })
  }

  var child_select = $(".child_select")
  var g_child_check_boxes = $(".g_child_check_boxes")
  var parent_select = $('.parent_select')
  var hide_wrap = $(".hide-wrap")
  parent_select.change(function() {
    var parent_val = $(this).val();
    if ($.isEmptyObject(parent_val)){
      hide_wrap.hide();
    } else {
      hide_wrap.show();
    }
    var parent_results = gon.children.filter(function(e){
      if (e.ancestry == parent_val){
        return e
      }
    })
    append_child_option(child_select, g_child_check_boxes, parent_results);
  });

  child_select.change(function() {
    var parent_val = parent_select.val();
    var child_val = $(this).val();
    var ancestry = `${parent_val}/${child_val}`
    var child_results = gon.g_children.filter(function(e){
      if (e.ancestry == ancestry){
        return e
      }
    })
    append_g_child_check_boxes(g_child_check_boxes,child_results);
  });

  var size_check_boxes = $(".size_check_boxes")
  var size_group_select = $('.size_group_select')
  size_group_select.change(function() {
    var size_group_val = $(this).val();
    var size_group_results = gon.sizes.filter(function(e) {
      if (e.size_group_id == size_group_val){
        return e
      }
    });
    append_size_check_boxes(size_check_boxes, size_group_results);
  });

  var price_select = $('.price_select')
  price_select.change(function(){
    var price_select_val = $(this).val().split(" ~ ");
    var min_price = price_select_val[0]
    var max_price = price_select_val[1]
    $('.min_price').val(min_price)
    $('.max_price').val(max_price)
  })

  var search_sort = $('#search_sort')
  search_sort.change(function(){
    if ($(this).val() != ''){
      current_url = window.location.href
      reg_url     = current_url.replace(/&q%5Bs%5D=(price|created_at)\+(asc|desc)/g, "")
      next_url = reg_url + "&q%5Bs%5D=" + $(this).val()
      window.location.href = next_url
    }
  })

  var clear_btn = $('.btn__clear')
  var search_input = $("input[type=search]")
  var checkboxes = $("input:checkbox")
  var checkbox_wrap = $('.check-box-wrap')
  var selects = $('select')
  clear_btn.click(function(){
    search_input.val('');
    checkboxes.attr("checked",false);
    checkbox_wrap.empty();
    selects.val('');
    child_select.hide();
  })

  var searchbar_button = $('.search-bar__button')
  var searchbar = $('.search-bar')
  searchbar_button.click(function(){
    searchbar.toggle();
  })
});

