require "sinatra/auth/github"
require "rest-client"
require "haml"
require "pry"

require_relative "models/init"

class ReviewMyCode < Sinatra::Base
  CLIENT_ID = '0e55acd10843bc0086b5'
  CLIENT_SECRET = 'd362cf4dbb02fab923d1d5a737d786af6519e745'

	enable :sessions

  set :github_options, {
    scopes:       "user",
    secret:       CLIENT_SECRET,
    client_id:    CLIENT_ID
  }

  register Sinatra::Auth::Github

  def current_user
    if authenticated? 
      user = User.find_by_uuid(github_user.id)
      if user.nil?
        access_token = github_user["token"]
        auth_result = RestClient.get("https://api.github.com/user", 
                                     {:params => {access_token: access_token, accept: :json}, 
                                                  accept: :json})
        auth_result = JSON.parse(auth_result)
        return User.create(uuid: auth_result['id'], gravatar_url: auth_result["avatar_url"])
      else
        return user
      end
    end
  end

  before do
    @current_user = current_user
  end

  get '/' do
    haml :index
  end

  get '/login' do
    authenticate!
    redirect "/"
  end
end
