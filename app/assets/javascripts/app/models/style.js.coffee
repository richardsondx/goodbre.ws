class App.Models.Style extends Backbone.Model
  url: ->
    '/styles/' + this.get('permalink')
