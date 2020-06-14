$(function()  {
  let tabs = $(".about");
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".content").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);
});

$(function()  {
  let tabs = $(".trade");
  function tabSwitch() {
    $(".move").removeClass("move");
    $(this).addClass("move");
    const index = tabs.index(this);
    $(".content_bottom").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);
});
