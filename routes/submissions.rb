ReviewMyCode.configure do |c|
  c.get '/submissions/new' do
    haml :"submissions/new"
  end

  c.post '/submissions' do
    binding.pry
    submission = Submission.new(params[:submission])
    submission.save
    redirect "submissions/#{submission.id}"
  end

  c.get '/submissions/:id' do |id|
    @submission = Submission.find(id)
    haml :"submissions/show"
  end
end
