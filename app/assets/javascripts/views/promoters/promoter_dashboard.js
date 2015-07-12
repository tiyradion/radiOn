Radion.Views.PromoterDashboard = Backbone.View.extend({

  el: 'main',

  template: JST['promoters/promoter_dashboard'],

  initialize: function() {

    this.render();

    $('html').addClass('promo-dashboard');

  },

  render: function () {

    this.$el.html(this.template());

  }

});
