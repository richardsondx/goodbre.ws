class App.Models.User extends Backbone.Model
  url: ->
    '/users/' + this.get('username')

class App.Collections.UsersCollection extends Backbone.Collection
  model: App.Models.User
  url: '/users'
