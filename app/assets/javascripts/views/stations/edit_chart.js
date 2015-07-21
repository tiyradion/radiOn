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

  newRanking: function (e) {

    var rank = $(e.target).closest('.ranking-div').data('rank');

    $('.ranking-modal').append(new Radion.Views.NewRanking({model: new Radion.Collections.Artists(), rank: rank}).$el);

  },

  update: function () {

    var chart=[];

    for(i=0; i<10; ++i) {
      var div = '[name=' + (i + 1) + ']';
      chart[i] = {
        id: $(div).data('id'),
        station_id: $(div).data('station-id'),
        rank: $(div).data('rank'),
        artist_id: $(div).data('artist-id')
      };
    }

    console.log(chart);

    $.ajax({
      url: '/api/stations/' + Radion.userId + '/rankings/batch_update' ,
      type: 'PUT',
      data: JSON.stringify(chart),
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done(function () {location.hash = "dashboard"}).fail(function () {
      console.log(arguments);
      alert('Failed to update.');
    });

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
