Radion.Views.NewContact = Backbone.View.extend ({

  className: 'modalDialog showing',

  events: {
    'click .btn-add-contact': 'addContact',
    'click .close': 'close'
  },

  myContacts: [],

  template: JST['new_contact'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');

    });

  },

  addContact: function(e) {

    var id = $(e.target).closest('li').data('userId').toString().split();

    this.myContacts = this.myContacts.concat(id);

    $.ajax({
        url: '/api/promoters/7',
        method: 'PUT',
        data: this.myContacts
      }).done().fail(function () {
        alert('Failed to update contacts.');
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

})
