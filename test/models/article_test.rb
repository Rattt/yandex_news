require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'custom article with expiration in the future' do
    custom_article = create(:custom_article)
    assert custom_article.expired_at > Time.now
  end
end
