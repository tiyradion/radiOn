Radion.Views.PromoterArtists = Backbone.View.extend({

  el: 'main',

  events: {
    "click .add-artist": "newArtist",
    "click .artist": "editArtist"
  },

  template: JST['promoters/promoter_artists'],

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

    var artistId = $(e.target).find('[name="artist-id"]').data('id');
    console.log(artistId);
    var artist = this.model.get(artistId);

    $('.artist-modal').append(new Radion.Views.EditArtist({ model: artist }).$el);
  },

  render: function () {

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
