Radion.Views.StationContacts = Backbone.View.extend({

  el: '.station-contacts',

  events: {
    "click .new-contact": "newContact"
  },

  template: JST['stations/station_contacts'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');

    });

  },

  newContact: function() {

    $('.contact-modal').append(new Radion.Views.NewContact({model: new Radion.Collections.Promoters()}).$el);

  },

  render: function () {

    this.$el.html(this.template({
      promoters: this.model.toJSON()
    }));

  }

});
