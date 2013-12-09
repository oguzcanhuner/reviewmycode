class Submission
  include MongoMapper::Document
  belongs_to :user

  key :code, String
  key :description, String
end
