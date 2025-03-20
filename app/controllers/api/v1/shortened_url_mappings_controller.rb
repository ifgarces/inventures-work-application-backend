class Api::V1::ShortenedUrlMappingsController < ApplicationController
  before_action :setShortenedUrlMapping, only: %i[show destroy]

private

  def setShortenedUrlMapping
    @shortenedUrlMapping = ShortenedUrlMapping.find(params.expect(:id))
  end

  def safeParams
    params.expect(shortenedUrlMapping: %i[target_url])
  end

public

  def index
    @shortenedUrlMappings = ShortenedUrlMapping.all

    return render(json: @shortenedUrlMappings)
  end

  def show
    return render(json: @shortenedUrlMapping)
  end

  def create
    @shortenedUrlMapping = UrlShortenerService.newShortenedUrlMappingFor(
      urlString: self.safeParams[:shortenedUrlMapping][:target_url]
    )

    if @shortenedUrlMapping.save
      return render(json: @shortenedUrlMapping, status: :created, location: @shortenedUrlMapping)
    end

    return render(json: @shortenedUrlMapping.errors, status: :unprocessable_entity)
  end

  def destroy
    @shortenedUrlMapping.destroy!
  end
end
