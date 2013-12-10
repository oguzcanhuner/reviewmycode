require "sinatra/auth/github"
require "rest-client"
require "haml"
require "pry"


class ReviewMyCode < Sinatra::Base
  set :root, File.dirname(__FILE__)
  CLIENT_ID = '0e55acd10843bc0086b5'
  CLIENT_SECRET = 'd362cf4dbb02fab923d1d5a737d786af6519e745'
  enable :sessions

  set :github_options, {
    scopes:       "user,gist",
    secret:       CLIENT_SECRET,
    client_id:    CLIENT_ID
  }

  register Sinatra::Auth::Github

  require_relative "models/init"
  require_relative "services/init"
  require_relative "routes/init"
  require_relative "helpers/init"

  helpers Helpers::Auth

  get '/' do
    haml :index
  end
end
