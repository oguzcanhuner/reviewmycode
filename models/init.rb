require "mongo_mapper"
require_relative "user"

#MongoMapper.setup({'production' => {'uri' => ENV['MONGODB_URI']}}, 'production')
MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "reviewmycode"
