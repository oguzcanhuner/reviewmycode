module Helpers
  module Auth
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
  end
end
