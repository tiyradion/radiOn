Radion.Views.PromoterList = Backbone.View.extend({

  el: '.promoter-list',

  template: JST['promoters/promoter_list'],

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
