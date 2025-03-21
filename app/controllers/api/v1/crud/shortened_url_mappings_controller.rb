class Api::V1::Crud::ShortenedUrlMappingsController < ApplicationController
  before_action :setShortenedUrlMapping, only: %i[show]

private

  def setShortenedUrlMapping
    @shortenedUrlMapping = ShortenedUrlMapping.find(params.expect(:id))
  end

public

  def index
    @shortenedUrlMappings = ShortenedUrlMapping.all
  end

  def show
  end
end
