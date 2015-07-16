Radion.Views.PromoterFeedbacks = Backbone.View.extend({

  el: '.promo-feedbacks',

  events: {
  },

  template: JST['promoters/promoter_feedbacks'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load feedback.');
      console.error(arguments);
    });

  },

  render: function () {

    this.$el.html(this.template({
      feedbacks: this.model.toJSON()
    }));

  }

});
