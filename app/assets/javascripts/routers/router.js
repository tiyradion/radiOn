Radion.Routers.Router = Backbone.Router.extend({

  routes: {
      "": "promoDashboard",
      "promo-dashboard": "promoDashboard",
      "station-dashboard": "stationDashboard",
      "listen/:id": "listen"
    },

    promoDashboard: function() {

      var view = new Radion.Views.ArtistList({model: new Radion.Collections.Artists()});

    },

    stationDashboard: function() {
      console.log("Station Dashboard");
    },

    listen: function(id) {

      var view = new Radion.Views.Listen({model: new Radion.Models.Artist({id: id})});
      console.log(view);
    },

    upload: function() {
      console.log("Upload");
    }

});
