$(document).on('turbolinks:load', function() {
  var upload_image = $(".sell-dropbox-items");
  function appendImage(image) {
    var i_count = ImageCount() + 1;
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
                     <input type="file" name="product[images_attributes][${i_count}][image]" id="product_images_attributes_${i_count}_image" val="${image}" src="${image}",class="hidden">
                </li>`
    upload_image.append(html);
  }


  // 削除機能
  $(document).on("click",".sell-image_delete",function(e) {
    $(this).parent().remove();
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
      appendImage(e.target.result)
      console.log(e.target.result);

    }
    reader.readAsDataURL(e.dataTransfer.files[0]);
    ImageCount();
  });

// クリック
  $('.product_images').change("click",function(e) {
    const reader = new FileReader();
    reader.onload = function (e) {
      appendImage(e.target.result)
    }
    var imgData = reader.readAsDataURL(this.files[0]);
    ImageCount();
  });

});
