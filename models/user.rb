class User
  include MongoMapper::Document

  has_many :gists

  key :uuid, Integer 
  key :name, String 
  key :username, String 
  key :gravatar_url, String 
end
