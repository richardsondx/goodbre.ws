class App.Models.User extends Backbone.Model
  urlRoot: '/users'
  paramRoot: 'users'

class App.Collections.UsersCollection extends Backbone.Collection
  model: App.Models.User
  url: '/users/' + this.model.permalink + '/similar_users'
