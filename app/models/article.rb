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

  private

  def broadcast_last_active
    article = self.class.last_active
    if article
      ActionCable.server.broadcast('last_article',
                                   title: article.title,
                                   annotation: article.annotation,
                                   created_at: created_at,
                                   expired_at: article.expired_at)
    end
  end
end
