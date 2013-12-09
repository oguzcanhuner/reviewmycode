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

  get '/submissions/new' do
    haml :"gists/new"
  end

  post '/submissions' do
    submission = Submission.new(params[:submission])
    submission.save
    redirect "submissions/#{submission.id}"
  end

  get '/submissions/:id' do |id|
    submission = Submission.find(id)
    "This is submission number #{submission.id}. \n\n
     Code is: #{submission.code}"
  end
end
