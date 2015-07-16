Radion.Views.PromoterContacts = Backbone.View.extend({

  el: '.contacts',

  events: {
    "click .new-contact": "newContact"
  },

  template: JST['promoters/promoter_contacts'],

  initialize: function() {
    this.listenTo(this.model, 'change remove add', this.render);
    this.refresh();
  },

  refresh: function () {
    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');
    });
  },

  newContact: function() {

    var myContacts = this.model.pluck('id');

    var modal = new Radion.Views.NewContact({model: new Radion.Collections.Stations(), myContacts: myContacts});

    modal.once('close', this.refresh());

    $('.contact-modal').append(modal.$el);

  },

  render: function () {

    this.$el.html(this.template({
      stations: this.model.toJSON()
    }));

  }

});
