Radion.Views.EditArtist = Backbone.View.extend({

  className: 'modalDialog showing',

  events: {
    'click .submit-new-artist': 'ajaxUpload',
    'click .close': 'close'
  },

  template: JST['promoters/edit_artist'],

  initialize: function() {

    this.render();

  },

  ajaxUpload: function() {

    var form = $('.new-artist-form');
    var musicSelector = $('input[type=file]', form);
    var file = musicSelector[0].files[0];
    var id = $('.new-artist-id').val();
    console.log(id)

    var formData = new FormData();
    formData.append('artist[name]', $('.new-artist-name', form).val());
    formData.append('artist[album_name]', $('.new-album-name', form).val());
    formData.append('artist[song_name]', $('.new-track-name', form).val());
    formData.append('artist[uploaded_file]', file);

    $.ajax({
      url: '/api/artists/' + id,
      type: 'PUT',
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done(this.remove()).fail(function () {
      console.log(arguments);
      alert('Failed to upload.');
    });

  },

  close: function() {

    this.remove();

  },

  render: function() {

    console.log(this.model);

    this.$el.html(this.template({
      artist: this.model.toJSON(),
      isNew: this.model.isNew()
    }));

  }

})
