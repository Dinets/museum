$(document).on 'load turbolinks:load', ->
  postsList = $('.posts-list')

  App.cable.subscriptions.create 'PostsChannel', {
    connected: ->
      console.log 'Posts connected!'
      @perform 'follow'
    ,
    received: (data) ->
      postsList.append data
  }
