class Api::V1::ShortenedUrlMappingsController < ApplicationController
  before_action :setShortenedUrlMapping, only: %i[show destroy]

private

  def setShortenedUrlMapping
    @shortenedUrlMapping = ShortenedUrlMapping.find(params.expect(:id))
  end

public

  def index
    @shortenedUrlMappings = ShortenedUrlMapping.all

    # return render(json: @shortenedUrlMappings)
  end

  def show
    # return render(json: @shortenedUrlMapping)
  end

  def destroy
    @shortenedUrlMapping.destroy!
  end
end
