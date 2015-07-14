Radion.Views.Listen = Backbone.View.extend({

  el: 'main',

  events: {
    'click #send-cd': 'textToggle'
  },

  template: JST['stations/listen'],

  initialize: function() {

    $('html').addClass('listen-html');

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch().done(this.render.bind(this)).fail(function () {
      alert('Failed to load artist.');
      console.error(arguments);
    });

    console.log(this.model);

  },

  textToggle: function () {
    $('#text-area').toggle();
  },

  render: function () {

    this.$el.html(this.template({
      artist: (this.model.toJSON())
    }));

    $('#text-area').hide();

  }

});
