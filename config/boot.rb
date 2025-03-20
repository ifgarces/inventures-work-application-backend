ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

# Read environment variables from .env file(s) and make them available through the application.
require "dotenv"
Dotenv.load(".env")
Dotenv.overload(".env.local") if File.exist?(".env.local")
