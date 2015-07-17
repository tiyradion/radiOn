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

    var stationId = Radion.userId;
    var artistId = $(e.target).siblings('[name="artist-id"]').attr('data-artist-id');

    $.ajax({
      url: '/api/promoters/' + stationId + '/artists/' + artistId,
      type: 'PATCH',
      data: {responded: true},
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done().fail(function () {
      console.log(arguments);
      alert('Failed to respond.');
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
