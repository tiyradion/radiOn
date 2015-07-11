Radion.Routers.Router = Backbone.Router.extend({

  routes: {
      "404": "badUrl",
      "": "home",
      "listen/:id": "listen"
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
        var PromoterDashboardView = new Radion.Views.PromoterDashboard();
        var promoterContactsView = new Radion.Views.PromoterContacts({model: new Radion.Collections.PromoterContacts()});
        var promoterArtistsView = new Radion.Views.PromoterArtists({model: new Radion.Collections.PromoterArtists()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    stationDashboard: function() {
      if(Radion.userType === "stations") {
        var mainView = new Radion.Views.StationDashboard();
        var stationContactsView = new Radion.Views.StationContacts({model: new Radion.Collections.StationContacts()});
        var stationArtistsView = new Radion.Views.StationArtists({model: new Radion.Collections.StationArtists()});
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

    },

    badUrl: function() {

      var view = new Radion.Views.BadUrl();

    }

});
