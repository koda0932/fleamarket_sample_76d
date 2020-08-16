$(document).ready(function () {
  $(".h-category").hover(
    function () {
      $(".h-category__modal").addClass("active");
      $(".h-category h2").addClass("h-category-top");
      var parent = $(".active").children(".parent-wrap");
      parent.show();
    },
    function () {
      $(".h-category__modal").removeClass("active");
      $(".h-category h2").removeClass("h-category-top");
      $(".h-category__modal").children(".parent-wrap").hide();
    }
  );

  $(".parent").hover(
    function () {
      $(this).addClass("active");
      $(this).children(".parent-link").addClass("parent-hover");
      var children = $(".active").children(".child-wrap");
      children.show();
    },
    function () {
      $(this).removeClass("active");
      $(this).children(".parent-link").removeClass("parent-hover");
      $(this).children(".child-wrap").hide();
    }
  );

  $(".child").hover(
    function () {
      $(this).addClass("active2");
      var grandChild = $(".active2").children(".grand-child-wrap");
      grandChild.show();
    },
    function () {
      $(this).removeClass("active2");
      $(this).children(".grand-child-wrap").hide();
    }
  );
});
