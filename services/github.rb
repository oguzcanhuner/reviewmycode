class Github
  attr_reader :user
  def initialize(params = {})
    @user = params[:user]
  end

  def get_gist(gist_id)
    response = RestClient.get("https://api.github.com/gists/#{gist_id}")
    response = JSON.parse(response)
  end

  def create_gist(params)
    if user
      content = params[:content].to_s
      gist_params = {"public"=>1,"files" => {"reviewmycode" => {"content" => content}}}.to_json

      user.api.post('gists', gist_params)
    end
  end
end
