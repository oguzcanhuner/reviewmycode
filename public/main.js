$(function() {
  $("#code-submit").on("click", function(e) {
    e.stopPropagation(); 
    $('.hidden-code-submission').val(editor.getValue());
    $('.submission-form').submit();
  });
});
