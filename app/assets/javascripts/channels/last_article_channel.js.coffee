App.last_article = App.cable.subscriptions.create 'LastArticleChannel',
  received: (data) ->
    console.log(data)
