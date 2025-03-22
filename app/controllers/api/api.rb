# frozen_string_literal: true

module Api; end

# Workaround for strange `Zeitwerk::NameError` on optimized builds for production.
module Api::Api; end unless Rails.env.development?
