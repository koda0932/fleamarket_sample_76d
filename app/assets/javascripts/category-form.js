$(function () {
  // 子のselectタグを追加
  function build_childSelect() {
    let child_select = `
              <select name="post[category_id]" id="post_category_id" class="post-new__field--input child_category_id">
                <option value="">---</option>
              </select>
              `
    return child_select;
  }

  // 孫のselectタグを追加
  function build_gcSelect() {
    let gc_select = `
              <select name="post[category_id]" id="post_category_id" class="post-new__field--input gc_category_id">
              </select>
              `
    return gc_select;
  }

  // selectタグにoptionタグを追加
  function build_Option(children) {
    let option_html = `
                      <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  // 親セレクトを変更したらjQueryが発火する
  $("#category_form").change(function () {
    // 親が変更したので子と孫を削除する
    $(".child_category_id").remove();
    $(".gc_category_id").remove();
    // 選択した親の値を取得する
    let parentValue = $("#category_form").val();
    // 初期値("---")以外を選択したらajaxを開始
    if (parentValue.length != 0) {
      $.ajax({
        url: '/posts/search',
        type: 'GET',
        // postsコントローラーにparamsをparent_idで送る
        data: { parent_id: parentValue },
        dataType: 'json'
      })
        .done(function (data) {
          // selectタグを生成してビューにappendする
          let child_select = build_childSelect
          $("#category_field").append(child_select);
          // jbuilderから取得したデータを1件ずつoptionタグにappendする
          data.forEach(function (d) {
            let option_html = build_Option(d)
            $(".child_category_id").append(option_html);
          })
        })
        .fail(function () {
          alert("通信エラーです！");
        });
    }
  });

  // 子セレクトを変更したらjQueryが発火する
  $(document).on("change", ".child_category_id", function () {
    // 子が変更されたので孫を削除する
    $(".gc_category_id").remove();
    // 選択した子の値を取得する
    let childValue = $(".child_category_id").val();
    // 初期値("---")以外を選択したらajaxを開始
    if (childValue.length != 0) {
      $.ajax({
        url: '/posts/search',
        type: 'GET',
        // postsコントローラーにparamsをchildren_idで送る
        data: { children_id: childValue },
        dataType: 'json'
      })
        .done(function (gc_data) {
          // selectタグを生成してビューにappendする
          let gc_select = build_gcSelect
          $("#category_field").append(gc_select);
          // jbuilderから取得したデータを1件ずつoptionタグにappendする
          gc_data.forEach(function (gc_d) {
            let option_html = build_Option(gc_d);
            $(".gc_category_id").append(option_html);
          });
        })
        .fail(function () {
          alert("gcで通信エラーです！");
        });
    }
  });

});