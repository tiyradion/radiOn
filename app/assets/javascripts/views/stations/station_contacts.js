Radion.Views.StationContacts = Backbone.View.extend({

  el: '.contacts',

  events: {
    "click .new-contact": "newContact"
  },

  template: JST['contacts'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

  },

  newContact: function() {

    $('.contact-modal').append(new Radion.Views.NewContact({model: new Radion.Collections.Promoters()}).$el);

  },

  refresh: function () {

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');
    });

  },

  render: function () {

    this.$el.html(this.template({
      contacts: this.model.toJSON()
    }));

  }

});
