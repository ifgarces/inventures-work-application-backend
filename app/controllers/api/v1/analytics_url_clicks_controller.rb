class Api::V1::AnalyticsUrlClicksController < ApplicationController
  before_action :setAnalyticsUrlClick, only: %i[show destroy]

private

  def setAnalyticsUrlClick
    @analyticsUrlClick = AnalyticsUrlClick.find(params.expect(:id))
  end

  def safeParams
    params.expect(
      analyticsUrlClick: %i[shortened_url_mapping_id ipv4_address user_agent other_device_data_json]
    )
  end

public

  def index
    @analyticsUrlClicks = AnalyticsUrlClick.all

    return render(json: @analyticsUrlClicks)
  end

  def show
    return render(json: @analyticsUrlClick)
  end

  def create
    @analyticsUrlClick = AnalyticsUrlClick.new(self.safeParams)

    if @analyticsUrlClick.save
      return render(json: @analyticsUrlClick, status: :created, location: @analyticsUrlClick)
    end

    return render(json: @analyticsUrlClick.errors, status: :unprocessable_entity)
  end

  def destroy
    @analyticsUrlClick.destroy!
  end
end
