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
    var pictureSelector1 = $('.new-picture-file-1', form);
    var pictureFile1 = pictureSelector1[0].files[0];
    var pictureSelector2 = $('.new-picture-file-2', form);
    var pictureFile2 = pictureSelector2[0].files[0];
    var pictureSelector3 = $('.new-picture-file-3', form);
    var pictureFile3 = pictureSelector3[0].files[0];
    var pictureSelector4 = $('.new-picture-file-4', form);
    var pictureFile4 = pictureSelector4[0].files[0];
    var pictureSelector5 = $('.new-picture-file-5', form);
    var pictureFile5 = pictureSelector5[0].files[0];
    var musicSelector = $('.new-music-file', form);
    var musicFile = musicSelector[0].files[0];

    var formData = new FormData();
    formData.append('artist[name]', $('.new-artist-name', form).val());
    formData.append('artist[album_name]', $('.new-album-name', form).val());
    formData.append('artist[song_name]', $('.new-track-name', form).val());
    formData.append('artist[bio]', $('.new-artist-bio', form).val());
    formData.append('artist[picture_upload_1]', pictureFile1);
    formData.append('artist[picture_upload_2]', pictureFile2);
    formData.append('artist[picture_upload_3]', pictureFile3);
    // formData.append('artist[picture_upload_4_file]', pictureFile4);
    // formData.append('artist[picture_upload_5_file]', pictureFile5);
    formData.append('artist[uploaded_file]', musicFile);

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

    Radion.globalEvents.trigger('addNewArtist');

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
