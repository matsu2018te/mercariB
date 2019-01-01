$(function() {

  var upload_image = $(".sell-dropbox-items");
  var i_count = 0;

  function appendImage(image) {
    var html = `<li class='sell-dropbox-items_container'>
                    <div class='sell-dropbox-items-figure'>
                        <img alt='商品画像' src='${image}'>
                    </div>
                    <a class="sell-dropbox-items-btn sell-image_edit">
                      <p>編集</p>
                    </a>
                    <a class="sell-dropbox-items-btn sell-image_delete">
                      <p>削除</p>
                    </a>
                </li>`
    upload_image.append(html);
  }



  // 削除機能
  $(document).on("click",".sell-image_delete",function(e) {
    $(this).parent().remove();
    i_count -= 1;
    ImageCount();
  });

// 4つ以上のときフォームを消す
function ImageCount() {
  var imagelist = $('li.sell-dropbox-items_container');
  if(imagelist.length >= 3){
    $('.sell-dropbox-uploader').addClass('hidden');
    $('ul.sell-dropbox-items').css('border','none');
  }
  else if(imagelist.length < 3){
    $('.sell-dropbox-uploader').removeClass('hidden');
    $('ul.sell-dropbox-items').css('border-right','thin dashed gray');
  }
  return imagelist.length
}


  var target = document.getElementById('drop');
  target.addEventListener('dragover', function (e) {
    e.preventDefault();
    e.stopPropagation();
    e.dataTransfer.dropEffect = 'copy';
  });

// ドラッグアンドドロップ
  target.addEventListener('drop', function (e) {
    e.stopPropagation();
    e.preventDefault();
    const reader = new FileReader();
    reader.onload = function (e) {
      appendImage(e.target.result,e.target)
    }
    reader.readAsDataURL(e.dataTransfer.files[0]);
    ImageCount();
  });

// クリック
  $('.product_images').on("change",function(e) {
    const reader = new FileReader();
    reader.onload = function (e) {
      appendImage(e.target.result,e.target);
    }
    reader.readAsDataURL(this.files[0]);
    i_count += 1;
    next_for_num = i_count+1
    $("label.sell-dropbox-uploader_container").attr('for','product_images_attributes_0_image'+ next_for_num);
  });

});
