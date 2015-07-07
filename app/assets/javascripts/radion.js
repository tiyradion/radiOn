window.Radion = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Radion.Routers.Router();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Radion.initialize();
});
