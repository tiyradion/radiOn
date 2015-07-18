Radion.Views.Contacts = Backbone.View.extend({

  el: '.contacts',

  events: {
    "click .new-contact": "newContact",
    "click .remove-contact": "removeContact"
  },

  template: JST['contacts'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

  },

  newContact: function() {

    if(Radion.userType === "promoters") {
      var allContacts = new Radion.Collections.Stations();
    } else {
      var allContacts = new Radion.Collections.Promoters();
    }

    var modal = new Radion.Views.NewContact({model: allContacts, myContacts: this.model});

    modal.once('close', this.refresh());

    $('.contact-modal').append(modal.$el);

  },

  removeContact: function(e) {

    var theId = parseInt($(e.target).data('contactId'));

    var ids = this.model
      .map(function (contact) { return contact.id; })
      .filter(function (id) { return id !== theId; });

    if(Radion.userType === "promoters") {
      var contactIds = {station_ids: ids};
    } else {
      var contactIds = {promoter_ids: ids};
    }

    $.ajax({
      url: '/api/' +Radion.userType + '/' + Radion.userId,
      method: 'PATCH',
      data: contactIds
    }).done(this.refresh()).fail(function () {
      alert("Failed to remove contact.");
    })

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
