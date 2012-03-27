class App.Models.Beer extends Backbone.Model
  urlRoot: '/beers'
  paramRoot: 'beers'

class App.Collections.BeersCollection extends Backbone.Collection
  model: App.Models.Beer
  url: '/breweries/' + this.brewery.id + '/beers'
