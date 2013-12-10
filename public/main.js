$(function() {
  $("#code-submit").on("click", function(e) {
    if(editor.getValue() == ''){
      e.preventDefault();
    }else{
      $('.hidden-code-submission').val(editor.getValue());
    }
  });
});
