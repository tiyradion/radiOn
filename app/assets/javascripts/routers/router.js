Radion.Routers.Router = Backbone.Router.extend({

  routes: {
      "404": "badUrl",
      "": "dashboard",
      "listen/:id": "listen"
    },

    badUrl: function() {

      var view = new Radion.Views.BadUrl();

    },

    dashboard: function() {
      if(Radion.userType === "promoters") {
        this.promoterDashboard();
      } else if (Radion.userType === "stations"){
        this.stationDashboard();
      }
    },

    promoterDashboard: function() {
      if(Radion.userType === "promoters") {
        var promoterDashboardView = new Radion.Views.PromoterDashboard();
        var promoterContactsView = new Radion.Views.PromoterContacts({model: new Radion.Collections.Stations()});
        var promoterArtistsView = new Radion.Views.PromoterArtists({model: new Radion.Collections.Artists()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    stationDashboard: function() {
      if(Radion.userType === "stations") {
        var stationDashboardView = new Radion.Views.StationDashboard();
        var stationContactsView = new Radion.Views.StationContacts({model: new Radion.Collections.Promoters()});
        var stationArtistsView = new Radion.Views.StationArtists({model: new Radion.Collections.Artists()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    listen: function(id) {
      if(Radion.userType === "stations") {
        var listenView = new Radion.Views.Listen({model: new Radion.Models.Artist({id: id})});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    }

});
