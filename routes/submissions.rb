ReviewMyCode.configure do |c|
  c.get '/submissions/new' do
    authorise_user!
    haml :"submissions/new"
  end

  c.post '/submissions' do
    authorise_user!
    github = Github.new(user: github_user)
    response = github.create_gist(content: params[:submission][:code])
    submission = Submission.create(user_id: current_user.id, gist_id: response.id)
    redirect "submissions/#{submission.id}"
  end

  c.get '/submissions/:id' do |id|
    submission = Submission.find(id)
    response = Github.new.get_gist(submission.gist_id)
    Gist.new(response)
    haml :"submissions/show"
  end
end
