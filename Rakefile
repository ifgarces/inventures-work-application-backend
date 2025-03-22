# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :app do
  desc "Run the Rails development server"
  task run: :environment do
    port = ENV.fetch("DEV_RUNTIME_PORT")
    sh "rails server --binding=0.0.0.0 --port=#{port} --log-to-stdout"
  end
end

namespace :lint do
  desc "Run RuboCop to check for code offenses"
  task check: :environment do
    sh "bundle exec rubocop"
  end

  desc "Run RuboCop and perform safe auto-corrections to code offenses"
  task fix: :environment do
    sh "bundle exec rubocop --autocorrect"
  end
end

namespace :db do
  desc "Load the database with mock data for testing"
  task mock: :environment do
    load Rails.root.join("db/mocks.rb")
  end
end
