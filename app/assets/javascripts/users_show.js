$(function(){

  $(".title-tag").on("click", function(){
    $(".selected-tag").removeClass("selected-tag");

    $(this).addClass("selected-tag");
    const index = $(".title-tag").index(this);
    $(".user-page__main__info-list").removeClass("show-info").eq(index).addClass("show-info");
 })

});