class Submission
  include MongoMapper::Document
  belongs_to :user

  key :gist_id, Integer
end
