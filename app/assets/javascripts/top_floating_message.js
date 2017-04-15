$(window).load(function(){
  floating_elem = $("#top-floating-message");
  floating_elem.find('a').click(function(){
    floating_elem.hide('slow');
  });
  setTimeout(function(){
    floating_elem.hide('slow')
  }, 25000);
});

$(window).scroll(function()
{
  $('#top-floating-message').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 350});
});
