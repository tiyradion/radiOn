Radion.Views.PromoterDashboard = Backbone.View.extend({

  el: 'main',

  template: JST['promoter_dashboard'],

  initialize: function() {

    this.render();

  },

  render: function () {

    this.$el.html(this.template());

  }

});
