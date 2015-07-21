Radion.Views.Contacts = Backbone.View.extend({

  el: '.contacts',

  events: {
    "click .new-contact": "newContact",
    "click .remove-contact": "removeContact",
    "click .all-notes": "allNotes",
    "click .single-note": "singleNote",
  },

  template: JST['contacts'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

    this.listenTo(Radion.globalEvents, 'addedNew', this.refresh);

  },

  newContact: function() {

    if(Radion.userType === "promoters") {
      var allContacts = new Radion.Collections.Stations();
    } else {
      var allContacts = new Radion.Collections.Promoters();
    }

    var modal = new Radion.Views.NewContact({model: allContacts, myContacts: this.model});

    Radion.globalEvents.on('newContact', this.refresh(), this);

    $('.contact-modal').append(modal.$el);

  },

  removeContact: function(e) {
    e.stopPropagation();

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
      url: '/api/' + Radion.userType + '/' + Radion.userId,
      method: 'PATCH',
      data: contactIds
    }).done(this.refresh()).fail(function () {
      alert("Failed to remove contact.");
    })

  },

  allNotes: function () {

    Radion.globalEvents.trigger('allNotes');

  },

  singleNote: function (e) {

    var id = parseInt($(e.target).data('contactId'));

    Radion.globalEvents.trigger('singleNote', id);

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
