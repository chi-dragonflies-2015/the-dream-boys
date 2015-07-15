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

  $('.comment_arrows').on('click', 'a', function(event){
    event.preventDefault();
    var that = $(this)
    var aurl = ($(this).attr("href"));
    var request = $.ajax({
                          url: aurl,
                          method: "POST"
    });
    request.done(function(response){
      console.log("Hey Courtnet")
      console.log(response["votes"])
      console.log(that)
      $('#vote_for_comments').text(response["votes"])
    });
  });






})
