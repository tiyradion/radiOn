Radion.Views.PromoterArtists = Backbone.View.extend({

  el: '.promo-artists',

  events: {
    "click .open-modal": "openModal",
    "click .close": "closeModal",
    "click .submit-new-artist": "ajaxUpload"
  },

  template: JST['artists/promoter_artist_list'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load artists.');
      console.error(arguments);
    });

  },

  openModal: function() {

    $('#openModal').addClass('showing');

    $('.modal-close, .modal-container').on('click', function () {
      $('.modal-container').removeClass('showing');
    });

    $('.modal').click(function (e) {
      e.stopPropagation();
    });

  },

  closeModal: function() {

    $('#openModal').removeClass('showing');
    
  },

  ajaxUpload: function () {

    var form = $('.new-artist-form');
    var musicSelector = $('input[type=file]', form);
    var file = musicSelector[0].files[0];

    var formData = new FormData();
    formData.append('artist[name]', $('.new-artist-name', form).val());
    formData.append('artist[album_name]', $('.new-album-name', form).val());
    formData.append('artist[song_name]', $('.new-track-name', form).val());
    formData.append('artist[uploaded_file]', file);

    $.ajax({
      url: '/api/artists', // The URL to post to
      type: 'POST', // The HTTP method (e.g. POST)
      data: formData, // The data to send to the server
      processData: false, // Disable jQuery's mangling of the data
      contentType: false, // Prevent jQuery from adding the content-type header
      dataType: 'json' // What we expect back from server
    }).done(console.log('Uploaded.')).fail(function () {
      console.log(arguments);
      alert('Failed to upload.');
    });

  },

  render: function () {

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
