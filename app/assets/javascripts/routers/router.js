Radion.Routers.Router = Backbone.Router.extend({

  routes: {
      "404": "badUrl",
      "": "dashboard",
      "dashboard": "dashboard",
      "artists": "artists",
      "listen/:id": "listen",
      "chart": "chart"
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
        var promoterContactsView = new Radion.Views.Contacts({model: new Radion.Collections.PromoterContacts(), contacts: new Radion.Collections.Stations()});
        var promoterFeedbacksView = new Radion.Views.PromoterFeedbacks({model: new Radion.Collections.PromoterFeedbacks()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    stationDashboard: function() {
      if(Radion.userType === "stations") {
        var stationDashboardView = new Radion.Views.StationDashboard();
        var stationContactsView = new Radion.Views.Contacts({model: new Radion.Collections.StationContacts(), contacts: new Radion.Collections.Promoters()});
        var stationArtistsView = new Radion.Views.StationArtists({model: new Radion.Collections.StationArtists()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    artists: function() {
      var promoterArtistsView = new Radion.Views.PromoterArtists({model: new Radion.Collections.PromoterArtists()});
    },

    listen: function(id) {
      if(Radion.userType === "stations") {
        var listenView = new Radion.Views.Listen({model: new Radion.Models.Artist({id: id})});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }

    },

    chart: function() {
      if(Radion.userType === "stations") {
        var chartView = new Radion.Views.Chart({model: new Radion.Models.Chart()});
      } else {
        var mainView = new Radion.Views.BadUrl();
      }
    }

});
