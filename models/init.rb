require "mongo_mapper"
require_relative "user"
require_relative "submission"

if ENV['RACK_ENV'] == "production"
  MongoMapper.setup({'production' => {'uri' => ENV['MONGOHQ_URL']}}, 'production')
else
  MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
end
MongoMapper.database = "reviewmycode"
