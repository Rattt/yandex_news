class LastArticleChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'last_article'
  end
end
