class ShortenedUrlMapping < ApplicationRecord
  has_many(:analytics_url_clicks, dependent: :destroy)

  validates(:target_url, presence: true)
  validates(:short_code, presence: true, uniqueness: true)
  validates(:expires_at, presence: true)
end
