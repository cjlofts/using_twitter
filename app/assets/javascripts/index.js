$(document).ready(function() {

  $("#clear-button").on("click",function(e) {
    e.preventDefault();
    $("#tweet-list").html('');
  })

  $("#search-button").on("click",function(e) {
    e.preventDefault();

    var tweetNumber = $("#tweet-number").val();
    var userName = $("#search-field").val();
    if (userName == "") {
      alert("You must put in a twitter handle!")
    } else {
      $.ajax({
          method: "GET",
          url: "/tweet",
          data: {tweet_value: userName, tweet_number: tweetNumber},
          error: function() {alert("error!")},
          success: function(response) {
            // var json = JSON.parse(response);
            for(var key in response) {
              $("#tweet-list").append("<li class='well'><span style='font-weight: bold'>"
               + userName + "</span> " + " on " + key + " : " + response[key] + "</li>");
            }
          }
        })
    }

  })


});
