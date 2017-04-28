(function ($) {
  $.fn.btn_close_parent = function(el){
    $(el).parent().remove();
  }
  $.fn.btn_hide_elem = function(elem_id){
    $("#" + elem_id).hide("fast");
  }
}(jQuery));

close_flash_message = function(){
  $("#flash-message").delay(8000).hide('slow')
    .find('.close-message').click(function(){ $(this).remove(); });

  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    defaultViewDate: '01/01/1990',
    autoclose: true,
    language: 'pt-BR',
    startDate: '01/01/1930',
    startView: 2,
    assumeNearbyYear: true,
  });
};

$(document).ready(close_flash_message);
