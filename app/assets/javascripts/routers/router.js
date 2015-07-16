Radion.Routers.Router = Backbone.Router.extend({

  routes: {
      "404": "badUrl",
      "": "dashboard",
      "dashboard": "dashboard",
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
        var promoterContactsView = new Radion.Views.PromoterContacts({model: new Radion.Collections.PromoterContacts()});
        var promoterFeedbacksView = new Radion.Views.PromoterFeedbacks({model: new Radion.Collections.PromoterFeedbacks()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    stationDashboard: function() {
      if(Radion.userType === "stations") {
        var stationDashboardView = new Radion.Views.StationDashboard();
        var stationContactsView = new Radion.Views.StationContacts({model: new Radion.Collections.StationContacts()});
        var stationArtistsView = new Radion.Views.StationArtists({model: new Radion.Collections.StationArtists()});
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
