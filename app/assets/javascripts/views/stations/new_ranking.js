Radion.Views.NewRanking = Backbone.View.extend({

  className: 'modalDialog showing',

  template: JST['stations/new_ranking'],

  initialize: function() {

    this.model.fetch();

    this.render();

  },

  close: function() {

    this.remove();

  },

  render: function() {

    this.$el.html(this.template({
      artists: this.model.toJSON()
    }));

  }

});
