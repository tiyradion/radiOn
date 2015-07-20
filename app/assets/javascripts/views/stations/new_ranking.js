Radion.Views.NewRanking = Backbone.View.extend({

  className: 'modalDialog showing ranking-modal',

  events: {
    'click .ranking-artist': 'addRanking'
  },

  template: JST['stations/new_ranking'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

  },

  addRanking: function (e) {



  },

  close: function() {

    this.remove();

  },

  refresh: function() {
    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load artists.');
    });
  },

  render: function() {

    console.log(this.model);

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
