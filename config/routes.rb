Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :analytics_url_clicks, only: %i[index show create]
      resources :shortened_url_mappings, only: %i[index show create]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "healthcheck" => "rails/health#show", as: :rails_health_check
end
