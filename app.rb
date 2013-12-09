require "sinatra/auth/github"
require "rest-client"
require "haml"
require "pry"


class ReviewMyCode < Sinatra::Base
  require_relative "models/init"
  require_relative "services/init"
  require_relative "routes/init"

  set :root, File.dirname(__FILE__)
  register API::Github

  get '/' do
    haml :index
  end
end
