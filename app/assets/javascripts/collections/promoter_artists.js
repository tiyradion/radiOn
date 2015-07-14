Radion.Collections.PromoterArtists = Backbone.Collection.extend({

  url: function() {
    return '/api/promoters/'+ Radion.userId +'/artists';
  }

});
