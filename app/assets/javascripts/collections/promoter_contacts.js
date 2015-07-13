Radion.Collections.PromoterContacts = Backbone.Collection.extend({

  initialize: function() {
    this.userId = Radion.userId;
  },

  url: function() {
    return '/api/promoters/'+ Radion.userId +'/stations';
  }

});
