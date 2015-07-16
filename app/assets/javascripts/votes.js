$(document).ready(function() {
  $('.game_arrows').on('click', 'a', function(event){
    event.preventDefault();
    var aurl = ($(this).attr("href"));
    var request = $.ajax({
                          url: aurl,
                          method: "POST"
    });
    request.done(function(response){
      $('#vote_for_games').text(response["votes"])
    });
  });

  $("#holder").on('click', ".comment_up_arrow", function(event){
    event.preventDefault();
    console.log("no")
    var that = ($(this).next())
    var nextThat = that.first()
    var commenturl = ($(this).attr("href"));
    var request = $.ajax({
                          url: commenturl,
                          method: "POST"
    });
    request.done(function(response){
      $(that.children(":first")).text(response["votes"])
    });
  });

  $("#holder").on('click', ".comment_down_arrow", function(event){
    event.preventDefault();
    var that = ($(this).prev())
    var nextThat = that.first()
    var commenturl = ($(this).attr("href"));
    var request = $.ajax({
                          url: commenturl,
                          method: "POST"
    });
    request.done(function(response){
      $(that.children(":first")).text(response["votes"])
    });
  });




})
