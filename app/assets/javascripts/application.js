// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
  $('.created-right-links').one('click', function(event){
    event.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/memorials/created',
      dataType: 'JSON',
      success: function(createdMemorials) {
        var list = [];
        for (var memorial in createdMemorials) {
          if(createdMemorials.hasOwnProperty(memorial)){
            var obj = createdMemorials[memorial];
            var url = "/memorials/" + obj["id"];
            var name = obj["deceased_name"];
            var render = "<li><a href='" + url + "'>" + name + "</a></li>";
            list.push(render); 
          }
        }
        for (var i=0; i < list.length; i++) {
          console.log(list[i])
          $('.created-right-links').append(list[i]);
          $("#created-memorials").attr("disabled", "disabled");
        }
        
      }
    });
  });
});