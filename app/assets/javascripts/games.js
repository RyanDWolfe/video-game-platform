
  $(function() {
    $(".js-more").on("click", function(event) {
      event.preventDefault()
      let $list = $(".gameGenre ul");
      $list.html('')
      var gameId = parseInt($(".js-more").attr("data-id"));
      $.get("/games/" + gameId + ".json", function(data) {
          $list.append('<ul><li>GENRE: ' + data.genre + '</li></ul>')
      });
    });
  });
