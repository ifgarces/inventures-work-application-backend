# frozen_string_literal: true

module Api
  module V1; end
end

# Workaround for strange `Zeitwerk::NameError` on optimized builds for production.
module Api::V1::V1; end unless Rails.env.development?
