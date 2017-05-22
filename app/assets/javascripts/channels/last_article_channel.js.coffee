App.last_article = App.cable.subscriptions.create 'LastArticleChannel',
  received: (article) ->
    console.log(article)
    if window.location.pathname == '/'
      document.getElementById('article-title').innerHTML = article.title
      document.getElementById('article-annotation').innerHTML = article.annotation
      document.getElementById('article-creation-date').innerHTML = humanizedDatetime(article.created_at)
