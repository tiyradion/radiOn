Radion.Views.ArtistList = Backbone.View.extend({

  el: 'main',

  template: JST['artists/artist_list'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load artists.');
      console.error(arguments);
    });

    console.log(this.model);
    
  },

  render: function () {

    this.$el.html(this.template({
      artists: _.chain(this.model.toJSON())
    }));
  }

});
