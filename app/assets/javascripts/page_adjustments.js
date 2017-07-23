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

$.ajaxSetup({
  beforeSend: function() {
    console.log("before");
  },
  afterSend: function(){
    console.log("after");
  }
});

ready_function = function(){
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

  pagination_links = $(".flickr_pagination a");
  if(pagination_links.length > 0){
    pagination_links.each(function(e){
      $(this).attr('data-remote', true);
      $(this).attr('data-method', 'post');

      $(this).ajaxSend(function(){
        Pace.options.ajax = false;
      }).ajaxComplete(function(){
        Pace.options.ajax = true;
      });
    })
  }
};

$(document).ready(ready_function).ajaxStart(function(){
  $("body").addClass("loading");
}).ajaxStop(function(){
  $("body").removeClass("loading");
});
