Radion.Views.StationArtistList = Backbone.View.extend({

  el: '.artist-list',

  events: {
    "click .submit-new-artist": "ajaxUpload"
  },

  template: JST['artists/station_artist_list'],

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
