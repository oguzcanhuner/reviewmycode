module API
  module Github 
    CLIENT_ID = '0e55acd10843bc0086b5'
    CLIENT_SECRET = 'd362cf4dbb02fab923d1d5a737d786af6519e745'

    module Helpers
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

    def self.registered(app)
      app.enable :sessions

      app.set :github_options, {
        scopes:       "user",
        secret:       CLIENT_SECRET,
        client_id:    CLIENT_ID
      }

      app.register Sinatra::Auth::Github
      app.helpers API::Github::Helpers

      app.get '/login' do
        authenticate!
        redirect "/"
      end
    end
  end
end
