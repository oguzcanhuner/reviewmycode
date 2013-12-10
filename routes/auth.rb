ReviewMyCode.configure do |c|
  c.get '/login' do
    authenticate!
    redirect "/"
  end
end
