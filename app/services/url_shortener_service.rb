class UrlShortenerService
  class << self
  private

    ASCII_CHARACTERS = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a

    # @return [String]
    def newUniqueShortCode!
      shortCode = (0..6).map { |_| ASCII_CHARACTERS.sample }.join
      isNotUnique = ShortenedUrlMapping.exists?(short_code: shortCode)
      if isNotUnique
        return self.newUniqueShortCode!
      end

      return shortCode
    end

  public

    # @param [String] urlString
    # @param [ActiveSupport::Duration] expirationDuration
    # @return [ShortenedUrlMapping] Resulting short URL.
    def newShortenedUrlMappingFor(urlString:, expirationDuration: 3.days)
      return ShortenedUrlMapping.new(
        target_url: urlString,
        short_code: self.newUniqueShortCode!,
        expires_at: Time.zone.now + expirationDuration
      )
    end
  end
end
