class User
  include DataMapper::Resource

  property :id, Serial 
  property :uuid, Integer 
  property :name, String 
  property :username, String 
  property :gravatar_url, String 
end
