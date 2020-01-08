
 tinymce.init({
   selector: 'textarea#editor',  //Change this value according to your HTML
   auto_focus: 'element1',
   width: "1000",
   height: "400"
 });
 
 $(document).ready(function() {
 
  $('#buttonpost').on("click", function(){
   tinyMCE.triggerSave();
   var value = $("textarea#editor").val();  
   $("#display-post").html(value);
   $(".texteditor-container").hide();
   return false;
  });
 
 });   
 
