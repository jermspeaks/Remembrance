$(function(){
  var pathName = window.location.pathname;

  $('#create-memorial').one('click', function(event){
    event.preventDefault();

    $.get('/admin/memorials/new', function(data){
       //create jquery object from the response html
       var $response=$(data);
       //query the jq object for the values
       var form = $response.find('.new-memorial-form');
      $('.center-links').append(form);
        console.log(response);
    });
  });



  $('#new-memorial-post').on('click', function(event){
    event.preventDefault();
    var postUrl = pathName + '/posts/new'
    $.get(postUrl, function(data){
       var $response=$(data);
       var form = $response.find('.new-post-form');
      $('.memorial-posts').append(form);
        console.log(response);
    });
  });


// $("#create_choice").on("submit", function(event) {
//         event.preventDefault();
//         $.ajax({
//             url: "/surveys/create",
//             type: "POST",
//             data: $(this).serialize(),
//             dataType: "json",
//             success: function(result) {
//                 console.log(result);
//                 $("ul").append("<li>" + result.choice_body + "</li>");
//                 $("#create_choice input[type = 'text']").val("")

//             }
//         });


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
        $("#flagged-post").attr("disabled", "disabled");
      }
    })
  });
});