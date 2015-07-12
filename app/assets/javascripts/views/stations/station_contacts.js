Radion.Views.StationContacts = Backbone.View.extend({

  el: '.station-contacts',

  template: JST['stations/station_contacts'],

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
      promoters: this.model.toJSON()
    }));

  }

});
