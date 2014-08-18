


$(function(){
  $('.attended-right-links').one('click', function(event){
    event.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/memorials/attended',
      dataType: 'JSON',
      success: function(attendedMemorials) {
        var list = [];
        for (var memorial in attendedMemorials) {
          if(attendedMemorials.hasOwnProperty(memorial)){
            var obj = attendedMemorials[memorial];
            var url = "/memorials/" + obj["id"];
            var name = obj["deceased_name"];
            var render = "<li><a href='" + url + "'>" + name + "</a></li>";
            list.push(render);
          }
        }
        for (var i=0; i < list.length; i++) {
          $('.attended-right-links').append(list[i]);
          $("#attended-memorials").attr("disabled", "disabled");
        }
        
      }
    });
  });
});