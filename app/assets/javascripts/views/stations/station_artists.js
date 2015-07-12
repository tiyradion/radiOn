Radion.Views.StationArtists = Backbone.View.extend({

  el: '.station-artists',

  template: JST['stations/station_artists'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load artists.');
      console.error(arguments);
    });

  },

  render: function () {

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
