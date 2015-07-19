Radion.Views.Chart = Backbone.View.extend({

  el: 'main',

  template: JST['stations/edit_chart'],

  events: {
    'click .js-ranking-album': 'newRanking',
    'click .update-chart': 'update'
  },

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

    Radion.globalEvents.on('updateRanking', this.updateRanking, this);

  },

  newRanking: function () {

    $('.ranking-modal').append(new Radion.Views.NewArtist({model: new Radion.Models.Artist()}).$el);

  },

  updateRanking: function () {



  },

  update: function () {

    var chart=[];

    for(i=1; i<11; ++i) {
      var div = '[name=' + i + ']';
      console.log(div);
      chart[i] = {
        id: $(div).data('id'),
        rank: $(div).find('.js-rank').data('rank'),
        name: $(div).find('.js-artist-name').data('artist-name'),
        album_name: $(div).find('.js-album-name').data('album-name'),
        artist_id: $(div).data('artist-id')
      };
    }

    console.log(chart);

    $.ajax({
      url: '/api/stations/' + Radion.userId + '/rankings',
      type: 'PUT',
      data: chart,
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done().fail(function () {
      console.log(arguments);
      alert('Failed to update.');
    });
    //
    // location.hash = "dashboard";

  },

  refresh: function() {
    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load chart.');
    });
  },

  render: function () {

    this.$el.html(this.template({
      rankings: (this.model.toJSON())
    }));

  }

});
