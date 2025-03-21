class Api::V1::Crud::AnalyticsUrlClicksController < ApplicationController
  before_action :setAnalyticsUrlClick, only: %i[show]

private

  def setAnalyticsUrlClick
    @analyticsUrlClick = AnalyticsUrlClick.find(params.expect(:id))
  end

  def safeModelParams
    return params.require(:analytics_url_click).permit(%i[ipv4_address user_agent other_device_data_json])
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
    @analyticsUrlClick = AnalyticsUrlClick.new(self.safeModelParams)
    @analyticsUrlClick.shortened_url_mapping = shortenedUrlMapping

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
