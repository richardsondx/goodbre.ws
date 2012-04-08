class App.Models.Brewery extends Backbone.Model
  url: ->
    '/breweries/' + this.get('permalink');

class App.Collections.BreweriesCollection extends Backbone.Collection
  model: App.Models.Brewery
  url: '/breweries'
