class Api::V1::UrlShortenerController < ApplicationController
  def shortenNewUrl
    targetUrlParam = params[:target_url]
    return render(json: { error: "target_url is required" }, status: :bad_request) if targetUrlParam.blank?

    shortenedUrlMappingRecord = UrlShortenerService.newShortenedUrlMappingFor(urlString: targetUrlParam)

    if shortenedUrlMappingRecord.save
      return render(
        status: :created,
        partial: "api/v1/crud/shortened_url_mappings/shortened_url_mapping",
        locals: { shortenedUrlMapping: shortenedUrlMappingRecord }
      )
    end

    return render(json: shortenedUrlMappingRecord.errors, status: :unprocessable_entity)
  end

  def retrieveTargetUrl
    shortCodeParam = params[:short_code]
    return render(json: { error: "short_code is required" }, status: :bad_request) if shortCodeParam.blank?

    shortenedUrlMappingRecord = ShortenedUrlMapping.find_by(short_code: shortCodeParam)

    if shortenedUrlMappingRecord
      return render(json: { target_url: shortenedUrlMappingRecord.target_url })
    end

    return head(:not_found)
  end
end
