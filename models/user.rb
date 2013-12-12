class User
  include MongoMapper::Document

  key :uuid, Integer 
  key :name, String 
  key :username, String 
  key :gravatar_url, String 
end
