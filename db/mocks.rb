require "faker"

# ShortenedUrlMappings
shortenedUrlMappingsCount = Faker::Number.between(from: 5, to: 10)
shortenedUrlMappingsCount.times do
  ShortenedUrlMapping.create!(
    target_url: Faker::Internet.url,
    short_code: Faker::Alphanumeric.alphanumeric(number: 6),
    expires_at: Faker::Time.forward(days: 30)
  )
end
puts("Created #{shortenedUrlMappingsCount} ShortenedUrlMappings")

# AnalyticsUrlClicks
ShortenedUrlMapping.last(shortenedUrlMappingsCount).find_each do |shortenedUrlMapping|
  clicksCount = Faker::Number.between(from: 0, to: 10)
  clicksCount.times do
    AnalyticsUrlClick.create!(
      ipv4_address: Faker::Internet.ip_v4_address,
      user_agent: Faker::Internet.user_agent,
      other_device_data_json: Faker::Json.shallow_json,
      shortened_url_mapping_id: shortenedUrlMapping.id
    )
  end
  puts("Created #{clicksCount} AnalyticsUrlClicks for ShortenedUrlMapping.id=#{shortenedUrlMapping.id}")
end
