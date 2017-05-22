class ArticlesController < ApplicationController
  before_action :set_custom_or_new_article, only: %i(edit update)

  def last_active
    @article = Article.last_active
  end

  def edit
  end

  def create
    @article = Article.new article_params

    if @article.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_custom_or_new_article
    @article = (Article.custom || Article.new)
  end

  def article_params
    params.require(:article).permit(:title, :annotation, :expired_at)
  end
end
