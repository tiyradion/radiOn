Radion.Views.NewArtist = Backbone.View.extend({

  className: 'modalDialog showing',

  events: {
    'click .submit-new-artist': 'ajaxUpload',
    'click .close': 'close'
  },

  template: JST['promoters/new_artist'],

  initialize: function() {

    this.render();

  },

  ajaxUpload: function() {

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
    }).done(this.remove()).fail(function () {
      console.log(arguments);
      alert('Failed to upload.');
    });

  },

  close: function() {

    this.remove();

  },

  render: function() {

    this.$el.html(this.template({
      artist: this.model.toJSON(),
      isNew: this.model.isNew()
    }));

  }

})
