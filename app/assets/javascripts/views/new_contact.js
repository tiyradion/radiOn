Radion.Views.NewContact = Backbone.View.extend ({

  className: 'modalDialog showing',

  events: {
    'click .btn-add-contact': 'addContact',
    'click .close': 'close'
  },

  template: JST['new_contact'],

  initialize: function(options) {

    this.myContacts = options.myContacts;

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');
    });

  },

  addContact: function(e) {

    var id = $(e.target).data('userId').toString().split();

    var ids = this.myContacts
      .map(function (contact) { return contact.id; })
      .concat(id);

    if(Radion.userType === "promoters") {
      var contactIds = {station_ids: ids};
    } else {
      var contactIds = {promoter_ids: ids};
    }

      $.ajax({
        url: '/api/' + Radion.userType + '/' + Radion.userId,
        method: 'PATCH',
        data: contactIds
      }).done(this.close()).fail(function () {
        alert("Failed to remove contact.");
      })

  },

  close: function() {

    this.trigger('close');
    this.remove();

  },

  render: function() {

    this.$el.html(this.template({
      users: this.model.toJSON()
    }));

  }

});
