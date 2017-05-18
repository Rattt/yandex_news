class ArticlesController < ApplicationController
  def last_active
    @article = Article.last_active
  end
end
