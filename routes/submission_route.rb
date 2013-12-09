class Submissions < Sinatra::Base
  get '/submissions/new' do
    haml :"submissions/new"
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
