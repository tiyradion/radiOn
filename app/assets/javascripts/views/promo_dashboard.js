Radion.Views.PromoDashboard = Backbone.View.extend({

  el: 'main',

  template: JST['promo_dashboard'],

  initialize: function() {

    this.render();

  },

  render: function () {

    this.$el.html(this.template());

  }

});
