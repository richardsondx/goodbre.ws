window.App =
  Models: {}
  Collections: {}
  Views: {}
  
  currentUser: (user) ->
    if user
      @user = new App.Models.User(user)
    else
      return @user
