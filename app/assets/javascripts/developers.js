
function Developer(attributes){
  this.id = attributes.id;
  this.name = attributes.name;
}

Developer.prototype.renderLi = function(){
  let html = '<li>' + this.name + '</li>'
  $("#gameName ul").append(html)
}

$(function() {
  $(".js-list").on("click", function(event) {
    event.preventDefault()
    let $list = $("#gameName ul");
    var devId = parseInt($(".js-list").attr("data-id"));
    $.get("/developers/" + devId + ".json", function(data) {
      $list.html('')
      data.games.forEach(function(game){
         displayGame = new Developer(game)
         displayGame.renderLi()
      })
    });
  });
});


  $(function () {
      $('form').submit(function(event) {
          event.preventDefault();
          var values = $(this).serialize();
          var posting = $.post('/developers', values);
          posting.done(function(data) {
            var developer = data;
            $("#developerName").text(developer["name"]);
          });
      });
  });
