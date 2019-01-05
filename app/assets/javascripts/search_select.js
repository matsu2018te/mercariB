$(function(){
  function append_child_option(results){
    var child_select = $(".child_select")
    child_select.empty();
    child_select.empty();
    child_select.append(`<option value="">---</option>`);
    results.forEach(function(result){
      child_select.append(`<option value="${result.id}">${result.name}</option>`)
    })
  }

  function append_g_child_check_boxes(results){
    var check_boxes = $(".g_child_check_boxes")
    check_boxes.empty();
    results.forEach(function(result){
      check_boxes.append(`<input type="checkbox" value="${result.id}" name="q[category_id_in][]" id="q_category_id_in_${result.id}">\n<label for="q_category_id_in_${result.id}">${result.name}</label>`)
    })
  }

  $('.parent_select').change(function() {
    var parent_val = $(this).val();
    var parent_results = gon.children.filter(function(e){
      if (e.ancestry == parent_val){
        return e
      }
    })
    append_child_option(parent_results);
  });

  $('.child_select').change(function() {
    var parent_val = $('.parent_select').val();
    var child_val = $(this).val();
    var ancestry = `${parent_val}/${child_val}`
    console.log(ancestry)
    var child_results = gon.g_children.filter(function(e){
      if (e.ancestry == ancestry){
        return e
      }
    })
    append_g_child_check_boxes(child_results);
  });
});

