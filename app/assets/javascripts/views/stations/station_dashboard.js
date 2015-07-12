Radion.Views.StationDashboard = Backbone.View.extend({

  el: 'main',

  template: JST['stations/station_dashboard'],

  initialize: function() {

    this.render();

    $('html').addClass('station-dashboard');

  },

  render: function () {

    this.$el.html(this.template());

  }

});
