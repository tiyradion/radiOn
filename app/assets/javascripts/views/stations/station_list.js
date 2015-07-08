Radion.Views.StationList = Backbone.View.extend({

  el: '.promo-contacts',

  template: JST['stations/station_list'],

  initialize: function() {

    this.render();

  },

  render: function () {

    this.$el.html(this.template());
  }

});
