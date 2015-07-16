Radion.Collections.PromoterFeedbacks = Backbone.Collection.extend({

  url: function() {
    return '/api/promoters/'+ Radion.userId +'/feedbacks';
  }

});
