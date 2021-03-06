Radion.Views.StationArtists = Backbone.View.extend({

  el: '.station-artists',

  events: {
    'click .js-remove-station-artist': 'removeArtist'
  },

  template: JST['stations/station_artists'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

    this.listenTo(Radion.globalEvents, 'allNotes', this.render);
    this.listenTo(Radion.globalEvents, 'singleNote', this.renderSingle);
    this.listenTo(Radion.globalEvents, 'addedNew', this.refresh);
    this.listenTo(Radion.globalEvents, 'deletedContact', this.refresh);

    Radion.globalEvents.trigger('removeNotes', this.render, this);

  },

  removeArtist: function(e) {

    var artistId = $(e.target).siblings('[name="artist-id"]').attr('data-artist-id');

    var self = this;

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
    }).done(function () { self.refresh(); }).fail(function () {
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

  },

  renderSingle: function (id) {

    var single = _.filter(this.model.toJSON(), function (artist) {
      return artist.promoter_id === id;
    });

    this.$el.html(this.template({
      artists: single
    }));

  }

});
