$(window).on('load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                  <input class="js-file" type="file"
                  name="item[images_attributes][${num}][image]"
                  id="item_images_attributes_${num}_image"<br>
                  <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();
  
    $('.form-data__image').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
  
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('image', blobUrl);
      } else {  
        $('#previews').append(buildImg(targetIndex, blobUrl));
        $('.js-remove').css("display","block");
        $('.form-data__image').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
    });

  $('.form-data__image').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('.form-data__image').append(buildFileField(fileIndex[0]));
  });
});