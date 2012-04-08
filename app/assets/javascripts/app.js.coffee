window.App = 
  Models: {}
  Views: {}
  Collections: {}

  currentUser: (user) ->
    if user
      @user = new App.Models.User(user)
    else
      return @user

$ ->
  # Set the sidebar's height to match the body's
  $('#sidebar').css
    'height': $('#content').height()
