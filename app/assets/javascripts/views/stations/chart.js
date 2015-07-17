Radion.Views.Chart = Backbone.View.extend({

  el: 'main',

  events: {
  },

  template: JST['stations/chart'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

    });

  },

  refresh: function() {
    this.model.fetch().done(this.render.bind(this)).fail(function () {
      alert('Failed to load chart.');
    });
  },

  render: function () {

    this.$el.html(this.template({
      chart: (this.model.toJSON())
    }));

  }

});
