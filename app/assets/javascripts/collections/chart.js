Radion.Collections.Rankings = Backbone.Collection.extend({

  url: function () {
    return '/api/stations/' + Radion.userId + '/rankings';
  }

});
