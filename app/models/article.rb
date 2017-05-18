class Article < ApplicationRecord
  scope :from_yandex, -> { where(expired_at: nil).order(:created_at) }

  validates_presence_of :title
  validates_datetime :expired_at, on_or_after: :now

  def self.custom
    find_by('expired_at >= ?', Time.now)
  end

  def self.last_active
    custom || from_yandex.first
  end
end
