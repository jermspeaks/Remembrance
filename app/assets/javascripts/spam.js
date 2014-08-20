$(function(){
  var pathName = window.location.pathname;
  $.ajax({
    type: 'GET',
    url: '/admin' + pathName + '/spam',
    dataType: 'JSON',
    success: function(flaggedPosts){
      if(flaggedPosts === "no_posts"){
        $("#flagged-post").hide();
      }
      else {
        var flagList = [];
        for (key in flaggedPosts) {
          var obj = flaggedPosts[key];
          console.log(obj['text']);
          console.log(obj['author_id'])
        }
        console.log(flaggedPosts);
        var renderFlags = flaggedPosts;
        $("flagged-post").append(renderFlags)
      }
    }
  })

  $("#flagged-post").click(function(event){
    $('#flag-content').toggle();
  });
}); 
  