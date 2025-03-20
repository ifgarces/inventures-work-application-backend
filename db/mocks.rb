require "faker"

10.times do
  ShortenedUrlMapping.create!(
    target_url: Faker::Internet.url,
    short_code: Faker::Alphanumeric.alphanumeric(number: 6),
    expires_at: Faker::Time.forward(days: 30)
  )
end
