require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get last_active article' do
    get root_url
    assert_response :success
  end

  test 'should create custom article' do
    assert_difference('Article.count') do
      article_params = { article: attributes_for(:custom_article) }
      post admin_url, params: article_params
    end

    assert_redirected_to root_url
  end

  test 'should update custom article' do
    article = create(:custom_article)
    new_article_params = {
      article: attributes_for(:custom_article, expired_at: 20.minutes.from_now)
    }
    patch admin_url, params: new_article_params
    assert article.reload.expired_at < new_article_params[:article][:expired_at]
    assert_redirected_to root_url
  end
end
