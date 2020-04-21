$(function(){
 $(".body-text").on("keyup", function() {
   let countNum = String($(this).val().length);
   $(".text-count").text("現在の文字数：" + countNum + "文字");
 });
});