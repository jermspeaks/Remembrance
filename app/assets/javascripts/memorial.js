


$(function(){
  var pathName = window.location.pathname;

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



  $('#flagged-post').on('click', function(event){
    event.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/admin' + pathName + '/spam',
      dataType: 'JSON',
      success: function(flaggedPosts){
        console.log(flaggedPosts);
        if(flaggedPosts === "no_posts"){
          alert("No Flagged Posts");
        }
        else{
          alert("Some posts have been flagged");
        }
      }
    })
  });
});