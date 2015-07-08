Radion.Views.StationDashboard = Backbone.View.extend({

  el: 'main',

  template: JST['station_dashboard'],

  initialize: function() {

    this.render();

  },

  render: function () {

    this.$el.html(this.template());

  }

});
