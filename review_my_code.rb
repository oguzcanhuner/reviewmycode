require "sinatra"
require "sinatra/auth/github"
require "rest-client"
require "haml"
require "pry"

class ReviewMyCode < Sinatra::Base
	CLIENT_ID = '0e55acd10843bc0086b5'
	CLIENT_SECRET = 'd362cf4dbb02fab923d1d5a737d786af6519e745'

	enable :sessions

  set :github_options, {
    :scopes    => "user",
    :secret    => CLIENT_SECRET,
    :client_id => CLIENT_ID,
    :callback_url => "/callback"
  }

  register Sinatra::Auth::Github

  get '/' do
    haml :index
  end

  get '/login' do
    authenticate!
  end

  get '/success' do
    access_token = github_user["token"]
    auth_result = RestClient.get("https://api.github.com/user", {:params => {:access_token => access_token, :accept => :json},
                                                                              :accept => :json})

    auth_result = JSON.parse(auth_result)

    haml :index
  end

  get '/callback' do
    if authenticated?
      redirect '/success'
    else
      authenticate!
    end
  end
end
