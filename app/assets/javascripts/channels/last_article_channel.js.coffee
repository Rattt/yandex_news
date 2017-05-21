App.last_article = App.cable.subscriptions.create 'LastArticleChannel',
  received: (article) ->
    document.getElementById('article-title').innerHTML = article.title
    document.getElementById('article-annotation').innerHTML = article.annotation
    document.getElementById('article-creation-date').innerHTML = humanizedDatetime(article.created_at)
    console.log(article)
