$(function(){
  var pathName = window.location.pathname;

  // Send report to moderator
  $('.report').on('click', function(event){
    event.preventDefault();
    var self = $(this).parent();
    var pathUrl = $(this).attr('href');
    $(this).remove();
    $.ajax({
      type: 'PUT',
      url: pathUrl,
      dataType: 'JSON',
      success: function(response){
        self.append("<p>" + response + "</p>");
      }
    });
  });

  // Moderator receives the reports
  $.ajax({
    type: 'GET',
    url: '/admin' + pathName + '/queue',
    dataType: 'JSON',
    success: function(reported){
      if (reported.length === 0) {
        console.log(reported);
        $('.report-queue').remove();
      }
      else {
        var queue = [];
        for (var j = 0; j < reported.length; j++) {
          var greenLightUrl = "/admin" + pathName + "/posts/" +reported[j].id + "/green_light";
          var redLightUrl = "/admin" + pathName + "/posts/" +reported[j].id + "/red_light";
          var render = "<div class='reported-posts'><p>" + reported[j].text + "</p><p>" + reported[j].poster + "</p><a class='accept-post' href='" + greenLightUrl + "'>accept this post?</a> | <a class='reject-post' href='" + redLightUrl + "'>reject this post?</a></div>";
          queue.push(render);
        }
        for (var k = 0; k < queue.length; k++) {
          $('#new-guest').after(queue[k]);
        }
        showQueue();
        modAccept();
        modReject();
      }
    }
  });

  var showQueue = function(){
    $('.report-queue').click(function(event){
      event.preventDefault();
      $('.reported-posts').toggle();
    });
  }

  // Moderator accepts post
  var modAccept = function(){
    $('.accept-post').on('click', function(event){
      event.preventDefault();
      var pathUrl = $(this).attr('href');
      $(this).parent().remove();
      $.ajax ({
        type: 'PUT',
        url: pathUrl,
        dataType: 'JSON',
        success: function(message){
          console.log(message);
        }
      });
    });
  };

  // Moderator rejects post
  var modReject = function(){
    $('.reject-post').on('click', function(event){
      event.preventDefault();
      var pathUrl = $(this).attr('href');
      $(this).parent().remove();
      $.ajax ({
        type: 'PUT',
        url: pathUrl,
        dataType: 'JSON',
        success: function(message){
          console.log(message);
        }
      });
    });
  };

  $('.dropdown-toggle').dropdown('toggle');

}); 
  