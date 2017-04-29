(function ($) {
  $.fn.btn_close_parent = function(el){
    $(el).parent().remove();
  }
  $.fn.btn_hide_elem = function(elem_id){
    $("#" + elem_id).hide("fast");
  }

}(jQuery));

var btn_close_parent = function(el){
  $(el).parent().remove();
}

toggleSong = function(elem_id){
  elem = $("#" + elem_id);
  elem.click(function(){
    song_elem = $("#main-song");
    if(elem.hasClass("fa-volume-off")){
      elem.removeClass("fa-volume-off");
      elem.addClass("fa-volume-up");
      song_elem.trigger("pause");
    }else{
      elem.removeClass("fa-volume-up");
      elem.addClass("fa-volume-off");
      song_elem.trigger("play");
    }
  });
}

close_flash_message = function(){
  toggleSong('volume-icon-btn');

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
