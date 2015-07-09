Radion.Routers.Router = Backbone.Router.extend({

  routes: {
      "promo-dashboard": "promoDashboard",
      "station-dashboard": "stationDashboard",
      "listen/:id": "listen"
    },

    promoterDashboard: function() {

      var mainView = new Radion.Views.PromoterDashboard();
      var stationListView = new Radion.Views.StationList({model: new Radion.Collections.Stations()});
      var artistListView = new Radion.Views.PromoterArtistList({model: new Radion.Collections.Artists()});

    },

    stationDashboard: function() {

      var mainView = new Radion.Views.StationDashboard();
      var promoterListView = new Radion.Views.PromoterList({model: new Radion.Collections.Promoters()});
      var artistListView = new Radion.Views.StationArtistList({model: new Radion.Collections.Artists()});

    },

    listen: function(id) {

      var view = new Radion.Views.Listen({model: new Radion.Models.Artist({id: id})});

    }

});
