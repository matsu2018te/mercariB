$(function(){
  function buildHTML(comment){
    var html = `
      <li class="clearfix">
        <div class="message-user">
          <div class="user-img">
            <img class="user-icon" src="/assets/user-icon.svg" alt="User icon">
          </div>
        </div>
        <div class="message-body">
          <div class="message-text">
            ${comment.content}
          </div>
          <div class="message-icons clearfix">
            <div class="icon-left">
              <i class="time"></i>
              <p class="text">50日前</p>
            </div>
            <div class="icon-right">
              <a class="report" href=""><i class="flag"></i></a>
            </div>
          </div>
          <i class="balloon"></i>
        </div>
      </li>
    `
    return html;
  }

  $('#post-comment').on('submit', function(e){
    // 同期通信を止める
    e.preventDefault();
    // FormDataを使って、formから送信されたデータを変数に格納
    var formData = new FormData(this);

    // attr メソッドを使ってform のaction属性を取得し、変数urlに代入
    var url = $(this).attr('action')
    // ajax通信
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    // ajax通信に成功したら
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('.text-input').val('');
      $('.post-btn').removeAttr('disabled');
    })
    // ajax通信に失敗した場合
    .fail(function() {
      alert('error');
    });

  });

});
