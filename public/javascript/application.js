$(function(){

  $('p.status').on('click', ".update-status", function(event){
    parent = $(this).parent();
    $.post('/update/' + $(this).data('id') + '/' + $(this).data('visiting'), function(data){
      parent.html(data);
    });
  });
  
  $(".winery").each(function(){
    el = $(this);
    $.get('/get_info/' + $(this).attr('id'), function(data){
      $(".extra-info", el).html(data);
    } )
  })

});
