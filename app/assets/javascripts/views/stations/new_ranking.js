Radion.Views.NewRanking = Backbone.View.extend({

  className: 'modalDialog showing ranking-modal',

  events: {
    'click .ranking-artist': 'addRanking',
    'click .close': 'close'
  },

  template: JST['stations/new_ranking'],

  initialize: function(options) {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

    this.options = options;

  },

  addRanking: function (e) {

    var artistId = $(e.target).closest('.station-artist').data('artistId');
    var albumName = $(e.target).closest('.station-artist').data('albumName');
    var artistName = $(e.target).closest('.station-artist').data('artistName');

    console.log(albumName);
    console.log(artistName);

    var div = '[name=' + this.options.rank + ']';

    $(div).attr('data-artist-id', artistId);
    $(div).find('.js-album-name').attr('data-album-name', albumName);
    $(div).find('.js-artist-name').attr('data-artist-name', artistName);
    $(div).find('.js-album-name').html(albumName);
    $(div).find('.js-artist-name').html(artistName);

    this.remove();

  },

  close: function () {
    this.remove();
  },

  refresh: function() {
    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load artists.');
    });
  },

  render: function() {

    console.log(this.model);

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
