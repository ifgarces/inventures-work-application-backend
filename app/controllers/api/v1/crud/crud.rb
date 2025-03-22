# frozen_string_literal: true

module Api
  module V1
    # Contains standard CRUD scaffold controllers for application models.
    module Crud; end
  end
end

# Workaround for strange `Zeitwerk::NameError` on optimized builds for production.
module Api::V1::Crud::Crud; end unless Rails.env.development?
