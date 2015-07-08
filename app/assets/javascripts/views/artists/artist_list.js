Radion.Views.ArtistList = Backbone.View.extend({

  el: '.promo-artists',

  template: JST['artists/artist_list'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load artists.');
      console.error(arguments);
    });

  },

  ajaxUpload: function (form) {

    var musicSelector = $('input[type=file]', form);
    var file = musicSelector[0].files[0];

    var formData = new FormData();
    formData.append('name', $('.new-artist-name', form));
    formData.append('album_name', $('.new-album-name', form));
    formData.append('song_name', $('.new-track-name', form));
    formData.append('uploaded_file', file);

    $.ajax({
      url: form.attr('action'), // The URL to post to
      type: form.attr('method'), // The HTTP method (e.g. POST)
      data: formData, // The data to send to the server
      processData: false, // Disable jQuery's mangling of the data
      contentType: false, // Prevent jQuery from adding the content-type header
      dataType: 'json' // What we expect back from server
    }).done(function (data) {
      $('img').remove();
      $('body').append('<img src="' + data.img + '">');
    }).fail(function () {
      console.log(arguments);
      alert('Failed to upload!');
    });

  },

  render: function () {

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));
  }

});
