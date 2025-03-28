class AnalyticsUrlClick < ApplicationRecord
  belongs_to(:shortened_url_mapping)

  validates(:ipv4_address, length: { maximum: 16 }, presence: true)
  validates(:user_agent, length: { maximum: 256 })
end
