require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'article should have title' do
    article = build(:article, title: nil)
    assert_not article.save
  end

  test 'article should expire in the future' do
    article = build(:article, expired_at: Date.yesterday)
    assert_not article.save
  end
end
