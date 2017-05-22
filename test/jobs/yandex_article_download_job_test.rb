require 'test_helper'

class YandexArticleDownloadJobTest < ActiveJob::TestCase
  test 'should create new yandex article' do
    assert_difference('Article.count') do
      YandexArticleDownloadJob.perform_now
    end
  end
end
