Radion.Views.Listen = Backbone.View.extend({

  el: 'main',

  events: {
    'click .slider-icons': 'textToggle',
    'click .btn-listen-pg': 'sendFeedback'
  },


  template: JST['stations/listen'],

  initialize: function() {

    $('html').removeClass('station-dashboard');
    $('html').addClass('listen-html');

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch().done(this.render.bind(this)).fail(function () {
      alert('Failed to load artist.');
      console.error(arguments);

    });

    this.textToggle;

    this.musicPlayer;

  },

  sendFeedback: function() {

    var id = $('.listen-form').find('input[name=artist-id]').attr('data-artist-id');
    var comment = $('.listen-form').find('.text-area').val();
    var mail = $('.listen-form').find('input[name=mail]').prop('checked');

    console.log(id);

    var feedback = {
      comment: comment,
      request: mail
    };

    $.ajax({
      url: '/api/artists/' + id + '/feedbacks/',
      type: 'POST',
      data: feedback,
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done().fail(function () {
      console.log(arguments);
      alert('Failed to upload.');
    });


  },

  textToggle: function (e) {
    var formEvent = ($(e.target).attr ('id'));
    $("#send-cd").prop('checked', formEvent === 'send-cd-icon')
    $(".comments").animate({bottom: '6em'}, "medium")
  },

  musicPlayer: function () {

  },



  render: function () {

    this.$el.html(this.template({
      artist: (this.model.toJSON())
    }));

    $('#text-area').hide();

  }

});
