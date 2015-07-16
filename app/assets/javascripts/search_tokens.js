$(document).on("ready", function () {
  var token = $("meta[name='csrf-token']");
  $("#game_search").attr("value", (token.attr("content")));
  $("#user_search").attr("value", (token.attr("content")));

});
