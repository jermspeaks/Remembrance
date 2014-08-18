
$(function(){
  $('.right-links').on('click', function(event){
    event.preventDefault();
    $.getJSON("/memorials/created", function(data){
      console.log(data);
      $('.right-links').append(data);
    });
  });
});