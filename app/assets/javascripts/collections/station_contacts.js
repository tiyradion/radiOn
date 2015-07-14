Radion.Collections.StationContacts = Backbone.Collection.extend({

  initialize: function() {
    this.userId = Radion.userId;
  },

  url: function() {
    return '/api/stations/'+ Radion.userId +'/promoters';
  }

});
