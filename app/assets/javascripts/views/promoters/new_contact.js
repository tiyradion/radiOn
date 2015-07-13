Radion.Views.NewContact = Backbone.View.extend ({

  className: 'modalDialog showing',

  events: {
    'click .close': 'close'
  },

  template: JST['promoters/new_contact'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load stations.');

    });

  },

  close: function() {

    console.log("close");
    this.remove();

  },

  render: function() {

    this.$el.html(this.template({
      stations: this.model.toJSON()
    }));

  }

})
