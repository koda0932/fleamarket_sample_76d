$(function () {
var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload input-edit-area" type="file"></div></div></label></li>`)
  $ul = $('#previews')
  $lis = $ul.find('.image-preview');
  $input = $ul.find('.input');

    if($lis.length < 4 ){
      $ul.append(append_input)
      $('#previews .input').css({
        'width': `calc(100% - (25% * ${$lis.length}))`
      })
    }
});