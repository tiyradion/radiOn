Radion.Views.Listen = Backbone.View.extend({

  el: 'main',

  template: JST['stations/listen'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch().done(this.render.bind(this)).fail(function () {
      alert('Failed to load artist.');
      console.error(arguments);
    });

  },

  render: function () {

    this.$el.html(this.template({
      artist: (this.model.toJSON())
    }));
  }

});
