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
  Radion.userId = $('#user-session-info').attr('data-userid');
  Radion.userType = $('#user-session-info').attr('data-usertype');
  Radion.initialize();
});
