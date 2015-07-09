Radion.Routers.Router = Backbone.Router.extend({

  routes: {
      "404": "badUrl",
      "": "home",
      "listen/:id": "listen"
    },

    badUrl: function() {

      var view = new Radion.Views.BadUrl();

    },

    home: function() {
      if(Radion.userType === "promoters") {
        this.promoterDashboard();
      } else if (Radion.userType === "stations"){
        this.stationDashboard();
      }
    },

    promoterDashboard: function() {
      if(Radion.userType === "promoters") {
        var mainView = new Radion.Views.PromoterDashboard();
        var stationListView = new Radion.Views.StationList({model: new Radion.Collections.Stations()});
        var artistListView = new Radion.Views.PromoterArtistList({model: new Radion.Collections.Artists()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    stationDashboard: function() {
      if(Radion.userType === "stations") {
        var mainView = new Radion.Views.StationDashboard();
        var promoterListView = new Radion.Views.PromoterList({model: new Radion.Collections.Promoters()});
        var artistListView = new Radion.Views.StationArtistList({model: new Radion.Collections.Artists()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    listen: function(id) {
      if(Radion.userType === "stations") {
        var mainView = new Radion.Views.Listen({model: new Radion.Models.Artist({id: id})});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    }

});
