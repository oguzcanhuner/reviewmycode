require "sinatra/auth/github"
require "rest-client"
require "haml"
require "pry"

require_relative "models/init"
require_relative "services/init"

class ReviewMyCode < Sinatra::Base
  register API::Github

  get '/' do
    #gists_result = RestClient.get("https://api.github.com/gists", params: {user_id: 6975991}) 
    #gists_result = JSON.parse(gists_result)
    haml :index
  end
end
