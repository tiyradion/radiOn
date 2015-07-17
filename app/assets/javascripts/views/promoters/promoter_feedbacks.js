Radion.Views.PromoterFeedbacks = Backbone.View.extend({

  el: '.promo-feedbacks',

  events: {
    'click .remove-promoter-feedback': 'removeFeedback'
  },

  template: JST['promoters/promoter_feedbacks'],

  initialize: function() {

    this.listenTo(this.model, 'change remove add', this.render);

    this.refresh();

  },

  removeFeedback: function (e) {

    var promoterId = Radion.userId;
    var feedbackId = $(e.target).siblings('[name="feedback-id"]').attr('data-feedback-id');

    $.ajax({
      url: '/api/promoters/' + promoterId + '/feedbacks/' + feedbackId,
      type : 'PATCH',
      contentType : 'application/json',
      data: JSON.stringify({ "op": "replace", "path": "/responded", "value": "true" }),
    }).done().fail(function () {
      console.log(arguments);
      alert('Failed to remove feedback.');
    });

  },

  refresh: function () {
    this.model.fetch({silent: true}).done(this.render.bind(this)).fail(function () {
      alert('Failed to load feedback.');
    });
  },

  render: function () {

    this.$el.html(this.template({
      feedbacks: this.model.toJSON()
    }));

  }

});
