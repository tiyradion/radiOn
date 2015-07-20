Radion.Views.PromoterChart = Backbone.View.extend({

  el: '.promo-chart',

  template: JST['promoters/promoter_chart'],

  initialize: function() {

    this.listenTo(Radion.globalEvents, 'rerender', this.remove);

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

  },

  refresh: function () {
    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load feedback.');
    });
  },

  render: function () {

    this.$el.html(this.template({
      rankings: this.model.toJSON()
    }));

  }

});
