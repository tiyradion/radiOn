Radion.Views.PromoterArtists = Backbone.View.extend({

  el: 'main',

  events: {
    "click .add-artist": "newArtist",
    "click .artist": "editArtist",
    "click .remove-artist": "removeArtist"
  },

  template: JST['promoters/promoter_artists'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

  },

  newArtist: function() {

    $('.artist-modal').append(new Radion.Views.NewArtist({model: new Radion.Models.Artist()}).$el);

  },

  editArtist: function(e) {

    var artistId = $('[name="artist-id"]').data('id');
    var artist = this.model.get(artistId);

    $('.artist-modal').append(new Radion.Views.EditArtist({ model: artist }).$el);
  },

  removeArtist: function(e) {

    var promoterId = Radion.userId;
    var artistId = $(e.target).siblings('[name="artist-id"]').attr('data-artist-id');

    $.ajax({
      url: '/api/promoters/' + promoterId + '/feedbacks/' + artistId,
      type: 'DELETE',
    }).done().fail(function () {
      console.log(arguments);
      alert('Failed to delete.');
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
