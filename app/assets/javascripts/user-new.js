$(function () {

  var pwd = $(".user-pass");
  var pwd_check = $(".user-new__field--check");

  pwd_check.change(function () {
    if ($(this).prop('checked')) {
      pwd.attr('type', 'text');
    } else {
      pwd.attr('type', 'password');
    }
  })

});