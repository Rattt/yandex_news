class Article < ApplicationRecord
  scope :from_yandex, -> { where(expired_at: nil).order(:created_at) }

  validates_presence_of :title, :annotation
  validates_datetime :expired_at, on_or_after: :now, allow_nil: true

  after_save :broadcast_last_active

  def self.custom
    find_by('expired_at >= ?', Time.now)
  end

  def self.last_active
    custom || from_yandex.last
  end

  def custom?
    return false unless expired_at
    expired_at >= Time.now
  end

  private

  def broadcast_last_active
    article = self.class.last_active
    if article
      ActionCable.server.broadcast('last_article',
                                   title: article.title,
                                   annotation: article.annotation,
                                   created_at: created_at,
                                   expired_at: article.expired_at)

      if article.custom?
        # download new yandex article
        # when it will be saved, broadcast_last_active method will be raised
        # and it will change custom article to yandex one in opened pages
        YandexArticleDownloadJob.set(wait_until: article.expired_at + 1.second)
                                .perform_later
      end
    end
  end
end
