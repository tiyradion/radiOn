Radion.Collections.PromoterContacts = Backbone.Collection.extend({

  url: function() {
    return '/api/promoters/'+ Radion.userId +'/stations';
  }

});
