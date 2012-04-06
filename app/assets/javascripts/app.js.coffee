window.App = Ember.Application.create

  Models: {}
  Views: {}
  Controllers: {}
  
  currentUser: (user) ->
    if user
      @user = new App.Models.User(user)
    else
      return @user

  start: ->
    # user = App.Models.User.create
    #   email: 'david@davidcelis.com'
    #   username: 'davidcelis'
    
    # alert 'Username: ' + user.username + '\nEmail: ' + user.email
    # return false

$ ->
  App.start()

  # Set the sidebar's height to match the body's
  $('#sidebar').css
    'height': $('#content').height()
