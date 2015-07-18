Radion.Views.StationArtists = Backbone.View.extend({

  el: '.station-artists',

  events: {
    'click .remove-station-artist': 'removeArtist'
  },

  template: JST['stations/station_artists'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

  },

  removeArtist: function(e) {

    var artistId = $(e.target).siblings('[name="artist-id"]').attr('data-artist-id');

    $.ajax({
      url: '/api/artists/' + artistId + '/feedbacks',
      type: 'POST',
      data: {
        comment: "",
        request: false
      },
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done(this.refresh()).fail(function () {
      console.log(arguments);
    });

  },

  refresh: function () {

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');
    });

  },

  render: function () {

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
