Radion.Views.BadUrl = Backbone.View.extend({

  template: JST['bad_url'],

  initialize: function() {

    this.render();

  },

  render: function () {

    this.$el.html(this.template());

  }

});
