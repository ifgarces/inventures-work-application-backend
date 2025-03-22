class Api::V1::Crud::AnalyticsUrlClicksController < ApplicationController
  before_action :setAnalyticsUrlClick, only: %i[show]

private

  def setAnalyticsUrlClick
    @analyticsUrlClick = AnalyticsUrlClick.find(params.expect(:id))
  end

  def safeModelParams
    return params.fetch(:analytics_url_click, {}).permit(:other_device_data_json)
  end

  def safeParentModelParams
    return params.require(:shortened_url_mapping).permit(:short_code)
  end

public

  def index
    @analyticsUrlClicks = AnalyticsUrlClick.all
  end

  def show
  end

  def create
    shortenedUrlMapping = ShortenedUrlMapping.find_by!(short_code: self.safeParentModelParams.fetch(:short_code))
    @analyticsUrlClick = AnalyticsUrlClick.new(
      self.safeModelParams.merge(
        {
          shortened_url_mapping: shortenedUrlMapping,
          ipv4_address: request.headers["HTTP_X_FORWARDED_FOR"] || request.headers["X_FORWARDED_FOR"] || request.remote_ip,
          user_agent: request.headers["HTTP_USER_AGENT"] || request.headers["USER_AGENT"]
        }
      )
    )

    if @analyticsUrlClick.save
      return render(
        status: :created,
        partial: "api/v1/crud/analytics_url_clicks/analytics_url_click",
        locals: { analyticsUrlClick: @analyticsUrlClick }
      )
    end

    return render(json: @analyticsUrlClick.errors, status: :unprocessable_entity)
  end
end
