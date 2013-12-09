require "mongo_mapper"
require_relative "user"
require_relative "submission"

#MongoMapper.setup({'production' => {'uri' => ENV['MONGODB_URI']}}, 'production')
MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "reviewmycode"
