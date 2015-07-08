Radion.Views.StationList = Backbone.View.extend({

  el: '.promo-contacts',

  template: JST['stations/station_list'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');
      console.error(arguments);

    console.log(this.model);
    });

  },

  render: function () {

    this.$el.html(this.template({
      stations: this.model.toJSON()
    }));

  }

});
