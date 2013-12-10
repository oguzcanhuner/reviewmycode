ReviewMyCode.configure do |c|
  c.get '/submissions/new' do
    haml :"submissions/new"
  end

  c.post '/submissions' do
    gist_params = {"public"=>1,"files" => {"reviewmycode" => {"content" => params[:submission][:code]}}}.to_json

    response = github_user.api.post('gists', gist_params)

    submission = Submission.new(gist_id: response.id)
    submission.save
    redirect "submissions/#{submission.id}"
  end

  c.get '/submissions/:id' do |id|
    submission = Submission.find(id)
    response = RestClient.get("https://api.github.com/gists/#{submission.gist_id}")
    response = JSON.parse(response)
    Gist = Struct.new(:content)
    @gist = Gist.new(response["files"]["reviewmycode"]["content"])
    haml :"submissions/show"
  end
end
