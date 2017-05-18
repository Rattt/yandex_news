class Article < ApplicationRecord
  validates_presence_of :title
  validates_datetime :expired_at, on_or_after: :now
end
