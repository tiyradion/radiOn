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
      type: 'PATCH',
      data: {responded: true},
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done().fail(function () {
      console.log(arguments);
      alert('Failed to respond.');
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
