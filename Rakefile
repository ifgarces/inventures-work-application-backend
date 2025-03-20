# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :lint do
  desc "Run RuboCop to check for code offenses"
  task :check do
    sh "bundle exec rubocop"
  end

  desc "Run RuboCop and perform safe auto-corrections to code offenses"
  task :fix do
    sh "bundle exec rubocop --autocorrect"
  end
end

namespace :app do
  desc "Run the Rails development server"
  task :run do
    port = ENV.fetch("DEV_RUNTIME_PORT")
    sh "rails server --environment=development --binding=0.0.0.0 --port=#{port} --log-to-stdout"
  end
end
