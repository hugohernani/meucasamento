close_flash_message = function(){
  $("#flash-message").delay(8000).hide('slow')
    .find('.close-message').click(function(){ $(this).remove(); });
};

$(document).ready(close_flash_message);
