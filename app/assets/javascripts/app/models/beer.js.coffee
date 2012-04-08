class App.Models.Beer extends Backbone.Model
  url: ->
    '/beers/' + this.get('id')

class App.Collections.BeersCollection extends Backbone.Collection
  model: App.Models.Beer
  url: '/beers'
