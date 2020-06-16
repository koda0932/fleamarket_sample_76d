$(function () {

  Payjp.setPublicKey('pk_test_62873b159b61e41f8452494b');
  const card_btn = $('#add-card-btn');

  if (card_btn != null) {
    card_btn.click(function (e) {
      e.preventDefault();
      $(function () {
        const card = {
          number: $('#card-num-input').val(),
          exp_month: $('#month-select').val(),
          exp_year: $('#year-select').val(),
          cvc: $('#security-code-input').val(),
        }
        form = $("#chargeForm")
        Payjp.createToken(card, function (status, response) {
          if (status === 200) {  //成功した場合
            form.append($('<input name="payjp_token" type="hidden">').val(response.id));
            form.submit();
            alert("カード情報を登録しました");
          } else {
            alert("正しいカード情報を入力してください");
          }
        })
      });
    });
  }

});