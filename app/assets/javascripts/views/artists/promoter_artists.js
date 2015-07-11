Radion.Views.PromoterArtists = Backbone.View.extend({

  el: '.promo-artists',

  events: {
    "click .open-modal": "newArtist",
    "click .artist-link": "editArtist"
  },

  template: JST['artists/promoter_artist_list'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load artists.');
      console.error(arguments);
    });

  },

  newArtist: function() {

    $('.artist-modal').append(new Radion.Views.NewArtist({model: new Radion.Models.Artist()}).$el);

  },

  editArtist: function(e) {
    var artistId = $(e.target).closest('li').data('artistId');
    var artist = this.model.get(artistId);

    $('.artist-modal').append(new Radion.Views.NewArtist({ model: artist }).$el);
  },

  render: function () {

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
