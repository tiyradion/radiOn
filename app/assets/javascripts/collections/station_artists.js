Radion.Collections.StationArtists = Backbone.Collection.extend({

  url: function() {
    return '/api/stations/'+ Radion.userId +'/artists';
  }

});
