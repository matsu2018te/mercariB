$(document).on('turbolinks:load', function() {
  // File API実装チェック
  // if (window.File) {
  //   // File APIが実装されている場合には、dropイベントを登録
  //   document.getElementById("drop").addEventListener("drop", onDrop, false);
  // } else {
  //   window.alert("本ブラウザではドラッグアンドドロップが使えません");
  // }
  var upload_image = $(".sell-dropbox-items");
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
}

function UpImage(image) {
  $(".upload-product-image").val(image);
};


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
    }
    var imgData = reader.readAsDataURL(e.dataTransfer.files[0]);
    UpImage(imgData)
    ImageCount();
  });

// クリック
  $('#product_image').change(function(e) {
    const reader = new FileReader();
    reader.onload = function (e) {
      appendImage(e.target.result)
    }
    var imgData = reader.readAsDataURL(this.files[0]);
    UpImage(imgData)
    ImageCount();
  });

});
