$(function () {

  // 出品画面で金額を入力すると発火する
  $("#money-input").keyup(function () {
    // 入力した金額を取得
    var p_input = $(this).val();
    if (p_input.length >= 3) {
      // 入力金額の10/1を取得（小数点切り捨て）
      del_fee = Math.floor(p_input / 10);
      del_fee = String(del_fee).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      $("#delivery-fee").text(del_fee);

      // 入力金額の0.9倍を取得（小数点切り捨て）
      f_profit = Math.floor(p_input * 0.9);
      f_profit = String(f_profit).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      $("#form-profit").text(f_profit);
    } else {
      $("#delivery-fee").text("-");
      $("#form-profit").text("-");
    }
  });

  // 編集ページ読み込み時に販売手数料と販売金額を表示する
  if (document.location.href.match(/\/posts\/\d/)) {
    // 金額を取得
    var p_input = $("#money-input").val();
    // 金額があるなら表示する
    if (p_input) {
      del_fee = Math.floor(p_input / 10);
      del_fee = String(del_fee).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      $("#delivery-fee").text(del_fee);

      // 入力金額の0.9倍を取得（小数点切り捨て）
      f_profit = Math.floor(p_input * 0.9);
      f_profit = String(f_profit).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      $("#form-profit").text(f_profit);
    }
  }

});